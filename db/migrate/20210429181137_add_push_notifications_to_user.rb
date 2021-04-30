class AddPushNotificationsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :push_notifications, :boolean, null: false, default: false
  end
end
