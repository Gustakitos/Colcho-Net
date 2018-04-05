class User < ApplicationRecord
  #attr_accessible :bio, :email, :full_name, :location, :password

  #validates_presence_of :email, :full_name, :location, :password
  validates_confirmation_of :password
  validates_length_of :bio, :minimum => 20, :allow_blank => false

  has_secure_password

  before_create :generate_token

  def generate_token
    self.confirmation_token= SecureRandom.urlsafe_base64
  end

  def confirm_token
    return if confirmed?

    self.confirmed_at = Time.current
    self.confirmation_token = ''
    save!
  end

  def confirm?
    confirmed_at.present?
  end

end
