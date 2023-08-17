class User < ApplicationRecord
    CONFIRMATION_TOKEN_EXPIRATION = 30.minutes

    has_secure_password

    validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}, presence: true, unique: true
    validates_presence_of :name

    def confirm!
        update_columns(confirmed_at: Time.current)
    end

    def confirmed?
        confirmed_at.present?
    end

    def generate_confirmation_token
        signed_id expires_in: CONFIRMATION_TOKEN_EXPIRATION, purpose: confirm_email
    end
    
    def unconfirmed?
        !confirmed?
    end
end
