ActiveAdmin.register Order, as:"Payment Confirmation" do
  
  permit_params do
   permitted = [:order]
  end
  
  actions :index
  #index title: I18n.t('labels.waiting_payment')
  menu label: I18n.t('labels.waiting_payment'), parent: "Pedidos"
  
  scope :waiting_payment, default: true
  
  index do
    id_column
    column :user_name
    column :total_value
    column :created_at
    column do |order|
      link_to "confirmar pagamento", confirm_payment_admin_payment_confirmation_path(order)
    end
  end
  
  member_action :confirm_payment do
    resource.making!
    OrderMailer.making(resource).deliver_now
    redirect_to admin_payment_confirmations_path
  end
  
end