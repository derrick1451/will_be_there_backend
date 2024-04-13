class DeleteForeignKey < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :rsvps, :events
    remove_foreign_key :events, :users
    add_foreign_key :rsvps, :events, on_delete: :cascade
    add_foreign_key :events, :users, on_delete: :cascade
  end
end
