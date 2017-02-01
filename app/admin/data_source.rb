ActiveAdmin.register DataSource do
  menu priority: 3, label: 'Datenquellen'
  decorate_with DataSourceDecorator

  index do
    column 'Ministerium', :ministry
    column 'Besonderes zur Quelle', :description
    column 'Dateiname', :csv_file_name
    column 'Anzahl Geschenke', :gifts_count
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
