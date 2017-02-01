class CreateDataSources < ActiveRecord::Migration
  def change
    create_table :data_sources do |t|
      t.integer :ministry_id
      t.text :description

      t.timestamps null: false
    end
  end
end
