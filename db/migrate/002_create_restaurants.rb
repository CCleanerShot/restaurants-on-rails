class CreateRestaurants < ActiveRecord::Migration[6.1]
  def change
    create_table :restaurants do |t|
      t.string :name, null: false
      t.text :address
      t.decimal :latitude, precision: 10, scale: 6, null: false
      t.decimal :longitude, precision: 10, scale: 6, null: false
      t.string :phone
      t.string :website
      t.text :description

      t.timestamps
    end

    add_index :restaurants, [ :latitude, :longitude ]
    add_index :restaurants, :name
  end
end
