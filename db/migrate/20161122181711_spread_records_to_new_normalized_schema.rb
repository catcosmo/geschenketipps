class SpreadRecordsToNewNormalizedSchema < ActiveRecord::Migration
  def change
    Gift.where(office: nil).destroy_all
    (Gift.pluck(:office).uniq - [nil]).each do |ministry_name|
      ministry = Ministry.create(name: ministry_name.strip)
      data_source = ministry.data_sources.create
      Gift.where(office: ministry_name).update_all(data_source_id: data_source.id)
    end
  end
end
