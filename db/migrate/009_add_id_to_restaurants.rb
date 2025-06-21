class AddIdToRestaurants < ActiveRecord::Migration[8.0]
  def change
    add_column :restaurants, :google_restaurant_id, :string
  end
end
