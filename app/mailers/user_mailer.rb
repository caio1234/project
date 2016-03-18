class UserMailer < ActionMailer::Base
  default from: 'kaoscaio@gmail.com'
 
   def welcome_email(user)
     @user = user
     @url  = 'www.google.com.br'
     mail(to: @user.email, subject: 'Bem vindo ao blog')
   end
  
end
