class AddYearMonthAndDayReceivedToGifts < ActiveRecord::Migration
  def change
    add_column :gifts, :year, :integer, default: nil
    add_column :gifts, :month, :integer, default: nil
    add_column :gifts, :day, :integer, default: nil
  end
end
