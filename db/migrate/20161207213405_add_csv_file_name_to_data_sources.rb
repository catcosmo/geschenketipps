class AddCsvFileNameToDataSources < ActiveRecord::Migration
  def change
    add_column :data_sources, :csv_file_name, :string
  end
end
