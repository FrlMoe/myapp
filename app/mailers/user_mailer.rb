class UserMailer < ApplicationMailer
  default from: "berlinbike@shop.com"

  def contact_form(email, name, message)
  @message = message
    mail(from: email,
         to: 'frauleinmoe@gmail.com',
         subject: "A new contact form message from #{name}")
  end
end
