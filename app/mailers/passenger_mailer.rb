class PassengerMailer < ApplicationMailer
  default from: 'freeflightbooker@samhoare.com'

  def confirmation_email
    @passenger = params[:passenger]
    @booking = params[:booking]
    mail(to: @passenger.email, subject: 'Your flight has been booked!')
  end
end
