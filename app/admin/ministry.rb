ActiveAdmin.register Ministry do
  menu priority: 2, label: 'Ministerien'
  decorate_with MinistryDecorator

  filter :name_cont, label: 'Ministerium'

  index do
    column 'Ministerium',:name
    column 'Link', :website_url
    column 'Anzahl Geschenke', :gifts_count_link, sortable: :gifts_count
    column 'Anzahl Datenquellen', :data_sources_count_link, sortable: :data_sources_count
    actions
  end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :list, :of, :attributes, :on, :model, :name, :abbreviation, :website_url
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
