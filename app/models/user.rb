class User < ApplicationRecord
  acts_as_token_authenticatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attachment :photo
  has_many :places
  after_create :send_welcome_email
  private

  def send_welcome_email
    UserMailer.welcome(self).deliver_now
  end

  acts_as_voter
end
