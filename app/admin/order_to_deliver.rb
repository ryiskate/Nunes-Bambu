ActiveAdmin.register Order, as:"To Deliver" do
  
  permit_params :track_number
  
  actions :index
  config.batch_actions = false
  menu label: I18n.t('labels.to_deliver'), parent: "Pedidos"
  
  scope :to_deliver, default: true
  
  index title: I18n.t('labels.to_deliver') do
    selectable_column
    id_column
    column :user_name
    column :total_value
    column :created_at
    column :track_number do |order|
      form_for :order, url: ready_to_deliver_admin_to_deliver_path(order) do |f|
        f.text_field :track_number
        f.submit
      end
    end
  end
  
  member_action :ready_to_deliver, method: :post do
    resource.track_number = params[:order][:track_number]
    OrderMailer.delivering(resource).deliver_now
    resource.delivering!
    flash[:notice] = "Pedido alterado com sucesso!"
    redirect_to admin_to_delivers_path
  end
  
end