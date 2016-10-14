ActiveAdmin.register Order, as:"Delivered" do
  
  permit_params do
   permitted = [:order]
  end
  
  actions :index
  config.batch_actions = false
  menu label: I18n.t('labels.delivered'), parent: "Pedidos"
  
  scope :delivered, default: true
  
  index title: I18n.t('labels.delivered') do
    id_column
    column :user_name
    column :total_value
    column :created_at
    column :Entregue do |order|
      form_for :order, url: delivered_admin_delivered_path(order) do |f|
        f.submit "entregue", data: { confirm: "Confirmar entrega do pedido #{order.id}?" }
      end
    end
  end
  
  member_action :delivered, method: :post do
    OrderMailer.delivered(resource).deliver_now
    resource.delivered!
    flash[:notice] = "Pedido alterado com sucesso!"
    redirect_to admin_delivereds_path
  end
  
end