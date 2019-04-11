class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :catch_phrase
      t.string :logo
      t.string :password

      t.timestamps
    end
  end
end
