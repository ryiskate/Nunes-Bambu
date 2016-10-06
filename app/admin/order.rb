ActiveAdmin.register Order do
  
  menu priority: 1, label: I18n.t('labels.all_orders'), parent: "Pedidos"
end