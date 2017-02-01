class GiftDecorator < Draper::Decorator
  delegate_all

  def ministry_link
    h.link_to data_source.ministry.name, h.ministry_path(data_source.ministry) unless data_source.ministry.nil?
  end
end
