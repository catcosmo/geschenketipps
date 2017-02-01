class DeleteOfficeAndAbbrFromGifts < ActiveRecord::Migration
  def change
    remove_column :gifts, :office
    remove_column :gifts, :abbr
  end
end
