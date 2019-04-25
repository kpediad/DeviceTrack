class UsersController < ApplicationController

  post '/login' do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
    else
      flash[:message] = "Authentication error! Please try again."
    end
    redirect_home
  end

  post '/signup' do
    if params[:username] && !params[:username].empty? then
      if User.exists?(params[:username]) then
        flash[:message] = "Username already in use. Please choose another."
      else
        if params[:password] && !params[:password].empty? then
          session[:user_id] = User.create(params).id
          flash[:message] = "New user account created succesfully!"
        else
          flash[:message] = "Please provide a password!"
        end
      end
    else
      flash[:message] = "Please provide a username!"
    end
    redirect_home
  end

  get '/logout' do
    if logged_in? then
      session.clear
    end
    redirect_home
  end
end
