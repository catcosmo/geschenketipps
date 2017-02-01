class AddGiftsCountToMinistries < ActiveRecord::Migration
  def self.up
    add_column :ministries, :gifts_count, :integer, null: false, default: 0

    DataSource.counter_culture_fix_counts
    Gift.counter_culture_fix_counts
  end

  def self.down
    remove_column :ministries, :gifts_count
  end
end
