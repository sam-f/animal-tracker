# frozen_string_literal: true

module Scheduling
  class Upcoming
    # TODO:
    #  A user can finish each schedule item. They can _not_ finish the schedule (unless repeat = never)
    #
    def initialize(current_user, current_date)
      @current_user = current_user
      @current_date = current_date
    end

    def self.find(current_user:, current_date:)
      new(current_user, current_date).find
    end

    def find
      Schedule
        .where(user: current_user)
        .where("start_on <= ?", current_date)
        .where("repeat IN :total OR repeat = :daily", total: repeat_for_total_days, daily: Repeat.daily)
    end

    def repeat_for_total_days
      next_days_of_week + next_days_of_month
    end

    def total_days
      @total_days ||= (0..3).to_a.map { |days_ahead| current_day + days_ahead.days }
    end

    def next_days_of_week
      total_days.map { |day| day_of_week_for(day) }
    end

    def next_days_of_month
      total_days.map(&:day)
    end

    def day_of_week_for(day)
      Repeat.to_weekday day.wday
    end

    private

    attr_reader :current_user, :current_date
  end
end
