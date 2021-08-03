class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :postal_code
      t.string :address
      t.string :name
      t.integer :shipping
      t.integer :claim
      t.integer :payment, default: 0
      t.integer :status, default: 0
      t.timestamps
    end
  end
end
