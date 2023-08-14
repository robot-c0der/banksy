class User < ApplicationRecord
    has_secure_password

    attr_accessible :email, :password, :password_confirmation, :login_name

    validates_uniqueness_of :email, :login_name
end
