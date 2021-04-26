# frozen_string_literal: true

module Scheduling
  class Repeat
    MISC = %w[
      daily
      never
    ].freeze

    WEEKDAYS = %w[
      monday
      tuesday
      wednesday
      thursday
      friday
      saturday
      sunday
    ].freeze

    def self.all
      (days_of_month + days_of_week + misc).freeze
    end

    def self.days_of_month
      (1..28).to_a
        .map(&:to_s).freeze
    end

    def self.days_of_week
      WEEKDAYS
    end

    def self.misc
      MISC
    end

    def self.to_weekday(integer)
      copy = days_of_week.slice(0, days_of_week.length - 1)
      copy.unshift(sunday)[integer]
    end

    class << self
      (MISC + WEEKDAYS).each do |repeat_options|
        repeat_options.each do |repeat_option|
          define_method(repeat_option) { repeat_option }

          define_method("#{repeat_option}?") do |potential_repeat_option|
            repeat_option == potential_repeat_option
          end
        end
      end
    end
  end
end
