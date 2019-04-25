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
      @types = Type.all
      erb :'devices/new'
    else
      redirect_home
    end
  end

  post '/devices' do
    #raise params.inspect
    if logged_in? then
      if !params[:name].empty? then
        if !params[:type_id].empty? then
          params[:user_id] = current_user.id
          Device.create(params.except(:type))
          flash[:message] = "Device created successfully!"
          redirect_home
        else
          if !params[:type][:name].empty? then
            params[:type_id] = Type.create(params[:type]).id
            params[:user_id] = current_user.id
            Device.create(params.except(:type))
            flash[:message] = "Device and Device Type created successfully!"
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

end
