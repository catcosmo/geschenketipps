class CreateMinistries < ActiveRecord::Migration
  def change
    create_table :ministries do |t|
      t.string :name
      t.string :abbreviation
      t.string :website_url

      t.timestamps null: false
    end
  end
end
