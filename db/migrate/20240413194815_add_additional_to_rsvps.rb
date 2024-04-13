class AddAdditionalToRsvps < ActiveRecord::Migration[7.1]
  def change
    add_column :rsvps, :additional_people, :boolean, default: false
  end
end
