class CreateRides < ActiveRecord::Migration
  def change
    create_table :rides do |t|
      t.string :name
      t.integer :user_id
      t.integer :attraction_id

      t.timestamps null: false
    end
  end
end
