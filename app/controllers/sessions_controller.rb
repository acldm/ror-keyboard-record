class SessionsController < ApplicationController
  skip_before_action :logged_in_user, only: [:new, :create]
  def new
  end

  def create
    user = User.find_by(name: params[:session][:name].downcase)
    puts "session current_user #{params[:session][:password]}"

    if user && user.authenticate(params[:session][:password])
      login_in(user)
      current_user()
      redirect_to(root_path)
    else
      render 'new'
    end
  end

  def destroy
    logout
    redirect_to root_url
  end
end
