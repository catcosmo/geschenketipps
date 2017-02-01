class Gift < ActiveRecord::Base
  belongs_to :data_source
  counter_culture [:data_source, :ministry]
  counter_culture :data_source

  def self.search(search)
    if search
      where(['name LIKE ?', "%#{search}%"])
    else
      all
    end
  end

  def increment_like
    self.like = like + 1
  end

  def increment_like!
    update_column(:like, increment_like)
  end


end
