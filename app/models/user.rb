class User < ApplicationRecord
  has_secure_password

  before_save :downcase_email

  validates :name, presence: true
  validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}, presence: true, uniqueness: true

  private

  def downcase_email
    self.email.downcase!
  end
end
