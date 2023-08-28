module Authentication
    extend ActiveSupport::Concern

    included do
        before_action :current_user
        helper_method :current_user
        helper_method :user_signed_in?
    end
    
    def login(user)
        reset_session
        active_session = user.active_sessions.create!(user_agent: request.user_agent, ip_address: request.ip)
        session[:current_active_session_id] = active_session.id

        active_session
    end

    def logout
        active_session = ActiveSession.find_by(id: session[:current_active_session_id])
        reset_session
        active_session.destroy! if active_session.present?
    end

    def redirect_if_authenticated
        redirect_to root_path, alert: "You are already logged in." if user_signed_in?
    end

    def forget_active_session
        cookies.delete :remember_token
    end

    def remember(active_session)
        cookies.permanent.encrypted[:remember_token] = active_session   .remember_token
    end

    def authenticate_user!
        #save whatever auth-required page the user was trying to access before we redirected them
        store_location
        redirect_to login_path, alert: "You must be logged in to access that page!" unless user_signed_in?
    end
        
    private

    def current_user
        Current.user ||= if session[:current_active_session_id].present?
            ActiveSession.find_by(id: session[:current_active_session_id])&.user
        elsif cookies.permanent.encrypted[:remember_token].present?
            ActiveSession.find_by(remember_token: cookies.permanent.encrypted[:remember_token])&.user
        end
    end

    def user_signed_in?
        Current.user.present?
    end

    def store_location
        # we only store GET requests and ensure local requests are stored so we don't redirect to
        # external sites/applications
        session[:user_return_to] = request.original_url if request.get? && request.local?
    end

end
