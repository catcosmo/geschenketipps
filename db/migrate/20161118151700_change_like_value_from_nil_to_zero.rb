class ChangeLikeValueFromNilToZero < ActiveRecord::Migration
  def change
    Gift.where(like: nil).each do |gift|
      gift.update_column(:like, 0)
    end
  end
end
