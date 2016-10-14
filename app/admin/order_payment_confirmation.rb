ActiveAdmin.register Order, as:"Payment Confirmation" do
  
  permit_params do
   permitted = [:order]
  end
  
  actions :index
  config.batch_actions = false
  menu label: I18n.t('labels.waiting_payment'), parent: "Pedidos"
  
  scope :waiting_payment, default: true
  
  index title: I18n.t('labels.waiting_payment') do
    id_column
    column :user_name
    column :total_value
    column :created_at
    column :making_days do |order|
      form_for :order, url: confirm_payment_admin_payment_confirmation_path(order) do |f|
        f.number_field :making_days
        f.submit "confirmar pagamento"
      end
    end
  end
  
  member_action :confirm_payment, method: :post do
    resource.making_days = params[:order][:making_days]
    OrderMailer.making(resource).deliver_now
    resource.making!
    flash[:notice] = "Pedido alterado com sucesso!"
    redirect_to admin_payment_confirmations_path
  end
  
end