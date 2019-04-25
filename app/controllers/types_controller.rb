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
    if logged_in? then
      if !params[:name].empty? then
        params[:user_id] = current_user.id
        Type.create(params)
        flash[:message] = "Device Type created successfully!"
        redirect_types_home
      else
        flash[:message] = "Please provide a type name!"
        redirect '/types/new'
      end
    else
      flash[:message] = "Device Type created successfully!"
      redirect_types_home
    end
  end

  get '/types/:id/edit' do

  end

  patch '/types/:id' do

  end

  delete '/types/:id/delete' do

  end

end
