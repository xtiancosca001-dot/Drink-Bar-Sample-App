class CreateDrinks < ActiveRecord::Migration[7.0]
  def change
    create_table :drinks do |t|
      t.string :brand
      t.float :quantity
      t.text :description

      t.timestamps
    end
  end
end
