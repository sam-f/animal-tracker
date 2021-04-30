# frozen_string_literal: true

module Dashboard
  module API
    class UsersController < APIController
      def profile
        @user = current_user
      end
    end
  end
end
