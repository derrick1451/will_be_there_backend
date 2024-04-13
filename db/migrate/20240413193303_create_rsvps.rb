class CreateRsvps < ActiveRecord::Migration[7.1]
  def change
    create_table :rsvps do |t|
      t.string :name
      t.string :email
      t.string :additional_people_names
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
