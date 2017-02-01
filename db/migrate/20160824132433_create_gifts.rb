class CreateGifts < ActiveRecord::Migration
  def change
    create_table :gifts do |t|
      t.string :name
      t.string :date
      t.string :value
      t.string :office
      t.string :fate
      t.string :abr
      t.string :success
      t.integer :like

      t.timestamps null: false
    end
  end
end
