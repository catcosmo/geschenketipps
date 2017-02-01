class AddGiftsCountToDataSources < ActiveRecord::Migration
  def self.up
    add_column :data_sources, :gifts_count, :integer, null: false, default: 0
  end

  def self.down
    remove_column :data_sources, :gifts_count
  end
end
