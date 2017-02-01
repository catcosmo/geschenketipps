class AddOver25EuroValueToGifts < ActiveRecord::Migration
  def change
    add_column :gifts, :value_over_25_euro, :boolean
    add_column :gifts, :value_under_25_euro, :boolean
  end
end
