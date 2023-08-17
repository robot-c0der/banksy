class User < ApplicationRecord
    validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}, presence: true, unique: true
    validates_presence_of :name
end
