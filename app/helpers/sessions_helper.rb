module SessionsHelper
    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end
    
    def logged_in?
        !!current_user
    end
    
    def store_location
        session[:forwarding_url] = request.url if request.get?
    end
    
    def log_in(user)
        session[:user_id] = user.id
    end
    
    def redirect_back_or(default)
      redirect_to(session[:forwarding_url] || default)
      session.delete(:forwarding_url)
    end
    
    def store_location
        session[:forwarding_url] = request.url if request.get?
    end
   
end
