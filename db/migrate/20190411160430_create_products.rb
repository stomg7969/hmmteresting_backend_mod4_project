class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.belongs_to :company, foreign_key: true
      t.integer :quota
      t.boolean :completed
      t.string :category
      t.text :description
      t.string :img

      t.timestamps
    end
  end
end
