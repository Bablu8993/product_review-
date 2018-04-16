class CreateUserProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :user_products do |t|
      t.string :user_email
      t.string :product_name

      t.timestamps
    end
  end
end
