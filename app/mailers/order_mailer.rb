class OrderMailer < ApplicationMailer
  
  def processing(user, order)
    byebug
    mail(to: user.email, subject: "#{user.first_name} recebemos seu pedido numero #{order.id}")
  end
  
  def payment(user)
    mail(to: user.email, subject: 'Processamos seu pedido ' + user.first_name)
  end
  
  def making(user)
    mail(to: user.email, subject: 'Recebemos seu pagamento ' + user.first_name)
  end
  
  def shipping(user)
    mail(to: user.email, subject: 'Terminamos seu pedido ' + user.first_name)
  end
  
  def delivered(user)
    mail(to: user.email, subject: 'Seu pedido foi entregue ' + user.first_name)
  end
  
end
