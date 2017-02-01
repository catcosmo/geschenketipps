class ChangeLikeDefaultValue < ActiveRecord::Migration
  def change
    change_column :gifts, :like, :integer, default: 0
  end
end
