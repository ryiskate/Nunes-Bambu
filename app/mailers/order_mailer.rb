class OrderMailer < ApplicationMailer
  
  def payment(order)
    @order = order
    mail(to: order.user.email, subject: "#{order.user.first_name} recebemos seu pedido numero #{order.id}")
  end
  
  def making(order)
    @order = order
    mail(to: order.user.email, subject: "#{order.user.first_name} confirmamos o pagamento do seu pedido numero #{order.id}")
  end
  
  def delivering(order)
    @order = order
    mail(to: order.user.email, subject: "#{order.user.first_name} enviamos o seu pedido numero #{order.id}")
  end
  
  def delivered(order)
    @order = order
    mail(to: order.user.email, subject: "#{order.user.first_name} seu pedido número #{order.id} foi entregue")
  end
  
end
