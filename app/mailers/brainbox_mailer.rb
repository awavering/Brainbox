class BrainboxMailer < ActionMailer::Base
  default from: "noreply@example.com"

  def feedback_email user, msg
    @user, @msg = user, msg
    mail(:to => [''], :subject => "A Brainbox user has provided feedback!")
  end

end
