class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :product_name
      t.references :category, foreign_key: true
      t.date :release_date
      t.integer :price
      t.integer :hitcount
      t.integer :user_count

      t.timestamps
    end
  end
end
