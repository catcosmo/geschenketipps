class MinistryDecorator < Draper::Decorator
  delegate_all

  def data_sources_count_link
    h.link_to(data_sources_count, h.gifts_path('q[data_source_id_eq]' => id))
  end

  def gifts_count_link
    h.link_to(gifts_count, h.gifts_path('q[data_source_ministry_id_eq]' => id))
  end
end
