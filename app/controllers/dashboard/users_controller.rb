# frozen_string_literal: true

module Dashboard
  class UsersController < DashboardController
    def profile
      @user = current_user
    end
  end
end
