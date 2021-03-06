class CreatePops < ActiveRecord::Migration[6.0]
  def change
    create_table :pops do |t|
      t.string :name
      t.text :description
      t.float :price
      t.string :category
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
