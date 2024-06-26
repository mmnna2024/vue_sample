class CreateServices < ActiveRecord::Migration[6.1]
  def change
    create_table :services do |t|
      t.string :name
      t.integer :price
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
