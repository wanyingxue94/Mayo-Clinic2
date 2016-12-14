class Usermailer < ActionMailer::Base
   default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.usermailer.welcome.subject
  #
  def welcome(patient)
	if !patient.nil?
		@patient = patient
		mail(:to => patient.email, :subject => "Mayo Clinic")
	end
  end
end
