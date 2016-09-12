class UserTalkMailer < ApplicationMailer
  
  def welcome(user)
    mail(to: user.email, subject: 'Bem vindo ' + user.first_name)
  end
  
end
