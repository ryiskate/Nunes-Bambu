class UserRegistrationController < Devise::RegistrationsController
  
  def create
    super
    if @user.persisted?
      UserTalkMailer.welcome(current_user).deliver_later
    end
  end
end
