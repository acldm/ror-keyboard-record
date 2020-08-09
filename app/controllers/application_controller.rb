class ApplicationController < ActionController::Base
    include SessionsHelper
    
    before_action :logged_in_user, except: [:register]

    def home
        @record = Record.new
    end

    def register
        @user = User.new
    end

    def record_show
        @record = Record.where(user_id: @current_user.id).order(:id).reverse_order.take
    end

    def logged_in_user
        if !logged_in?
            redirect_to login_url
        end
    end
end