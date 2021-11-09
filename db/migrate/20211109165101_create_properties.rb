class CreateProperties < ActiveRecord::Migration[6.1]
  def change
    create_table :properties do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :operation_type, null: false
      t.integer :status, null: false
      t.string :address, null: false, unique: true
      t.integer :price, null: false
      t.integer :maintenance
      t.integer :property_type, null: false
      t.integer :beds, null: false, default: 1
      t.integer :baths, null: false, default: 1
      t.float :area, null: false
      t.boolean :pets, default: false
      t.text :description, null: false

      t.timestamps

    end

    add_index :properties, :address,                unique: true
  end
end
