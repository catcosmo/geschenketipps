class Ministry < ActiveRecord::Base
  has_many :data_sources
  has_many :gifts, through: :data_sources
end
