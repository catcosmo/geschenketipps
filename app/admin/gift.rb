ActiveAdmin.register Gift do
  menu priority: 1, label: 'Geschenke'
  decorate_with GiftDecorator

  filter :name_cont, label: 'Geschenk' #mit autocomplete der wörter

  filter :data_source_ministry_name, :as => :select, label: 'Ministerium', :collection => Ministry.all.map(&:name)
  filter :year, :as => :select, label: 'Jahr' #:collection => Gift.all.map(&:year).uniq#, :as => :select, :label_method  #year, month, day jeweils als einzelner drop-down, default 'alle'
  filter :month, :as => :select, label: 'Monat'
  filter :value #min & max eingabefeld
  filter :value_under_25_euro, as: :check_boxes, label: 'Nur Geschenke unter 25€ anzeigen.', :collection => [['Ja', true]]
  filter :success, as: :check_boxes, label: 'Nur Geschenke anzeigen die behalten wurden.', :collection => [['Ja', true]]
  filter :like, as: :check_boxes, label: 'Nur beliebte Geschenke anzeigen.',  :collection => [['Ja', 0]]


  member_action :like, method: :put do
    resource.increment_like!
    redirect_to resource_path, notice: 'Geschenk wurde als interessant markiert!'
  end

  action_item :view, only: :show do
    link_to 'Geschenk gefällt mir', like_gift_path(gift), method: :put
  end

  index do
    column 'Ministerium', :abr #:ministry_link, sortable: :ministry_id
    column 'Geschenk', :name, label: 'Geschenk'
    column 'Wert', :value
    column 'Jahr', :year
    column 'Monat', :month
    column 'Verbleib', :fate
    column 'Wurde behalten?', :success
    column 'Likes', :like
    column 'Interessantes Geschenk!' do |gift|
      link_to 'Jefällt ma!', like_gift_path(gift), method: :put
    end
  end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
