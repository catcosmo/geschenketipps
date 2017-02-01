class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :keywords
      t.string :ministry
      t.string :max_price
      t.boolean :successfull
      t.boolean :popular

      t.timestamps null: false
    end
  end
end
