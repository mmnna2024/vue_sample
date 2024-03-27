class CreateItemsServices < ActiveRecord::Migration[6.1]
  def change
    create_table :items_services do |t|
      t.references :item, null: false, foreign_key: true
      t.references :service, null: false, foreign_key: true

      t.timestamps
    end
  end
end
