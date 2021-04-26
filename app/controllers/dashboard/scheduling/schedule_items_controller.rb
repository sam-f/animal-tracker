# frozen_string_literal: true

module Dashboard
  module Scheduling
    class ScheduleItemsController < SchedulingController
      def upcoming
        @schedule_items = current_user.schedule_items
      end
    end
  end
end
