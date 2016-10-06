ActiveAdmin.register Order, as:"To Deliver" do
  
  permit_params do
   permitted = [:order]
  end
  
  actions :index
  #index title: I18n.t('labels.to_deliver')
  menu label: I18n.t('labels.to_deliver'), parent: "Pedidos"
  
  scope :to_deliver, default: true
  
  index do
    id_column
    column :user_name
    column :total_value
    column :created_at
    column do |order|
      form_for :order, url: ready_to_deliver_admin_to_deliver_path(order) do |f|
        f.input :track_number
        f.submit
      end
    end
  end
  
  member_action :ready_to_deliver do
    resource.delivering!
    byebug
    resource.track_number = params[:order[:track_number]]
    OrderMailer.delivering(resource).deliver_later
    redirect_to admin_to_delivers_path
  end
  
end