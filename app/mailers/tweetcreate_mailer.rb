class TweetcreateMailer < ApplicationMailer
  def send_email(user_email)

    @user_email = user_email
    
    mail to: user_email, subject: "つぶやきを投稿しました"
  end
end
