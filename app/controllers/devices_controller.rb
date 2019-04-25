class DevicesController < ApplicationController

  get '/devices' do
    if !logged_in? then
      redirect_home
    else
      erb :'devices/index'
    end
  end

  get '/devices/new' do
    if logged_in? then
      @types = current_user.types
      erb :'devices/new'
    else
      redirect_home
    end
  end

  post '/devices' do
    if logged_in? then
      if !params[:name].empty? then
        if !params[:type_id].empty? then
          params[:user_id] = current_user.id
          Device.create(params.except(:type))
          flash[:message] = "Device created successfully!"
          redirect_home
        else
          if !params[:type][:name].empty? then
            params[:type][:user_id] = current_user.id
            params[:type_id] = Type.find_or_create(params[:type]).id
            params[:user_id] = current_user.id
            Device.create(params.except(:type))
            flash[:message] = "Device created successfully!"
            redirect_home
          else
            flash[:message] = "Please specify a device type!"
            redirect '/devices/new'
          end
        end
      else
        flash[:message] = "Please specify a device name!"
        redirect '/devices/new'
      end
    else
      flash[:message] = "You need to log in first!"
      redirect_home
    end
  end

  get '/devices/:id' do
    if logged_in? then
      @device = Device.find(params[:id])
      if current_user.devices.include?(@device) then
        erb :'devices/show'
      else
        flash[:message] = "You cannot view this device!"
        redirect_home
      end
    else
      redirect_home
    end
  end

  get '/devices/:id/edit' do
    if logged_in? then
      @device = Device.find(params[:id])
      if current_user.devices.include?(@device) then
        @types = current_user.types
        erb :'devices/edit'
      else
        flash[:message] = "You cannot edit this device!"
        redirect_home
      end
    else
      redirect_home
    end
  end

  patch '/devices/:id' do
    if logged_in? then
      if !params[:name].empty? then
        if !params[:type_id].empty? then
          device = Device.find(params[:id])
          if current_user.devices.include?(device) then
            device.update(params.except(:id, :type, :_method))
            flash[:message] = "Device updated successfully!"
            redirect_home
          else
            flash[:message] = "You cannot edit this device!"
            redirect_home
          end
        else
          if !params[:type][:name].empty? then
            device = Device.find(params[:id])
            if current_user.devices.include?(device) then
              params[:type][:user_id] = current_user.id
              params[:type_id] = Type.find_or_create(params[:type]).id
              device.update(params.except(:id, :type, :_method))
              flash[:message] = "Device Updated successfully!"
              redirect_home
            else
              flash[:message] = "You cannot edit this device!"
              redirect_home
            end
          else
            flash[:message] = "Please specify a device type!"
            redirect "/devices/#{params[:id]}/edit"
          end
        end
      else
        flash[:message] = "Please specify a device name!"
        redirect "/devices/#{params[:id]}/edit"
      end
    else
      flash[:message] = "You need to log in first!"
      redirect_home
    end
  end

  delete '/devices/:id/delete' do
    if logged_in? then
      device = Device.find(params[:id])
      if current_user.devices.include?(device) then
        device.delete
        flash[:message] = "Device deleted successfully!"
      else
        flash[:message] = "You cannot delete this device!"
      end
    else
      flash[:message] = "You need to log in first!"
    end
    redirect_home
  end

end
