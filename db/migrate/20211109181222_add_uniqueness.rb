class AddUniqueness < ActiveRecord::Migration[6.1]
  def change
    add_index :favorites, [:user_id, :property_id], unique: true
    add_index :contacts, [:user_id, :property_id], unique: true
  end
end
