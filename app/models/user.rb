class User < ApplicationRecord
    # email confirmation constants
    CONFIRMATION_TOKEN_EXPIRATION = 30.minutes
    MAILER_FROM_EMAIL = "no-reply.banksy@ioerror.ca"

    # password reset constants
    PASSWORD_RESET_TOKEN_EXPIRATION = 12.hours


    has_secure_password

    before_save :downcase_email
    
    validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}, presence: true, uniqueness: true
    validates_presence_of :name

    def confirm!
        update_columns(confirmed_at: Time.current)
    end

    def confirmed?
        confirmed_at.present?
    end

    def generate_confirmation_token
        signed_id expires_in: CONFIRMATION_TOKEN_EXPIRATION, purpose: :confirm_email
    end

    def generate_password_reset_token
        signed_id expires_in: PASSWORD_RESET_TOKEN_EXPIRATION, purpose: :reset_password
    end
    
    def unconfirmed?
        !confirmed?
    end

    def send_confirmation_email!
        confirmation_token = generate_confirmation_token
        UserMailer.confirmation(self, confirmation_token).deliver_now
    end

    def send_password_reset_email!
        password_reset_token = generate_password_reset_token
        UserMailer.password_reset(self, password_reset_token).deliver_now
    end


    private

    def downcase_email
        self.email = email.downcase
    end

end
