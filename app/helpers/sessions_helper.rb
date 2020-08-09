module SessionsHelper
  def login_in(user)
    session[:user_id] = user.id
    puts "login_in user_id #{session[:user_id]}"

  end

  def current_user
    puts "current_user user_id #{session[:user_id]}"
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end
  
  def logout
    session.delete(:user_id)
    @current_user = nil
  end
end