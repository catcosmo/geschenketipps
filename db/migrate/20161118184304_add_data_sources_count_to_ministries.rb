class AddDataSourcesCountToMinistries < ActiveRecord::Migration
  def self.up
    add_column :ministries, :data_sources_count, :integer, null: false, default: 0
  end

  def self.down
    remove_column :ministries, :data_sources_count
  end
end
