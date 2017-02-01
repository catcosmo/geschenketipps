class DataSource < ActiveRecord::Base
  belongs_to :ministry
  counter_culture :ministry
  has_many :gifts
end
