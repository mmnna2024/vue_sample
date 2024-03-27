class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.date :ordered_date
      t.integer :status
      t.integer :channel
      t.integer :price
      t.references :user, null: false, foreign_key: true
      t.references :shipping_address, null: false, foreign_key: true

      t.timestamps
    end
  end
end
