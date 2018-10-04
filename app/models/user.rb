class User < ApplicationRecord
  before_save :email_downcase
  validates :name,  presence: true, length: {maximum: Settings.users.name_length}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: Settings.users.email_length},
    format: {with: VALID_EMAIL_REGEX},uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, presence: true, length: {minimum: Settings.users.pass_length_min}

  private

  def email_downcase
    email.downcase!
  end
end
