class AddDataSourceToGifts < ActiveRecord::Migration
  def change
    add_column :gifts, :data_source_id, :integer
  end
end
