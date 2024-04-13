class AddAttendingToRsvps < ActiveRecord::Migration[7.1]
  def change
    add_column :rsvps, :attending, :boolean, default: false
  end
end
