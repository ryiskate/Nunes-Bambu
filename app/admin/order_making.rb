ActiveAdmin.register Order, as:"Making" do
  
  permit_params do
   permitted = [:order]
  end
  
  actions :index
  #index title: I18n.t('labels.making')
  menu label: I18n.t('labels.making'), parent: "Pedidos"
  
  scope :making, default: true
  
  index do
    id_column
    column :user_name
    column :total_value
    column :created_at
    column do |order| 
      link_to "concluido", production_done_admin_making_path(order), data: { confirm: "Você fez todos os items do pedido #{order.id}?" }
    end
  end
  
  member_action :production_done do
    resource.to_deliver!
    redirect_to admin_makings_path
  end
  
end