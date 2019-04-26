class TypesController < ApplicationController

  get '/types' do
    if logged_in? then
      erb :'types/index'
    else
      flash[:message] = "You need to log in first!"
      redirect_home
    end
  end

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
      @type = Type.find(params[:id])
      if current_user.types.include?(@type) then
        erb :'types/show'
      else
        flash[:message] = "You cannot view this device type!"
        redirect_types_home
      end
    else
      flash[:message] = "You need to log in first!"
      redirect_home
    end
  end

  post '/types' do
    if logged_in? then
      if !params[:name].empty? then
        params[:user_id] = current_user.id
        if !Type.find_by(params) then
          Type.create(params)
          flash[:message] = "Device Type created successfully!"
          redirect_types_home
        else
          flash[:message] = "A type with the same name already exists!"
          redirect_types_home
        end
      else
        flash[:message] = "Please provide a type name!"
        redirect '/types/new'
      end
    else
      flash[:message] = "You need to log in first!"
      redirect_home
    end
  end

  get '/types/:id/edit' do
    if logged_in? then
      @type = Type.find(params[:id])
      if current_user.types.include?(@type) then
        erb :'types/edit'
      else
        flash[:message] = "You cannot edit this type!"
        redirect_types_home
      end
    else
      flash[:message] = "You need to log in first!"
      redirect_home
    end
  end

  patch '/types/:id' do
    if logged_in? then
      type = Type.find(params[:id])
      if current_user.types.include?(type) then
        if !params[:name].empty? then
          type.update(name: params[:name])
          flash[:message] = "Type updated successfully!"
          redirect_types_home
        else
          flash[:message] = "Please provide a type name!"
          redirect "/types/#{type.id}/edit"
        end
      else
        flash[:message] = "You cannot edit this type!"
        redirect_types_home
      end
    else
      flash[:message] = "You need to log in first!"
      redirect_home
    end
  end

  delete '/types/:id/delete' do
    if logged_in? then
      type = Type.find(params[:id])
      if current_user.types.include?(type) then
        type.delete
        flash[:message] = "Type deleted successfully!"
        redirect_types_home
      else
        flash[:message] = "You cannot delete this type!"
        redirect_types_home
      end
    else
      flash[:message] = "You need to log in first!"
      redirect_home
    end
  end

end
