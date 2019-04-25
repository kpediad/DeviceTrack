class TypesController < ApplicationController

  get '/types/new' do
    if logged_in? then
      erb :'types/new'
    else
      flash[:message] = "You need to log in first!"
      redirect_home
    end
  end

  get '/types/:id' do
    if logged_in? then
      @devices = Device.find_by(user_id: current_user.id, type_id: params[:id])
      erb :'types/show'
    else
      flash[:message] = "You need to log in first!"
      redirect_home
    end
  end

  post '/types' do

  end

  get '/types/:id/edit' do

  end

  patch '/types/:id' do

  end

  delete '/types/:id/delete' do

  end

end
