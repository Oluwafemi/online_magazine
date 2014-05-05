ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :user_name            => "contextfree9@gmail.com",
  :password             => ENV['SMTP_PASSWORD'],
  :authentication       => "plain",
  :enable_starttls_auto => true
}

