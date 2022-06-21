class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :name
      t.string :address1
      t.string :address2
      t.integer :pincode
      t.integer :city
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
