class PlaceMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.place_mailer.thank_you.subject
  #
  def thank_you(place)
    @place = place
    @user = @place.user

    mail(to: "#{@place.user.email}", subject: "Thanks for your contribution with #{@place.name}")
  end
end
