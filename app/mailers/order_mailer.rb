class OrderMailer < ApplicationMailer
  
  def payment(order)
    mail(to: order.user.email, subject: "#{order.user.first_name} recebemos seu pedido numero #{order.id}")
  end
  
  def making(order)
    mail(to: order.user.email, subject: "#{order.user.first_name} confirmamos o pagamento do seu pedido numero #{order.id}")
  end
  
  def delivering(order)
    mail(to: order.user.email, subject: "#{order.user.first_name} enviamos o seu pedido numero #{order.id}")
  end
  
  def delivered(user)
    mail(to: user.email, subject: 'Seu pedido foi entregue ' + user.first_name)
  end
  
end
