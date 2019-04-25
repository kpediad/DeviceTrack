class ComponentsController < ApplicationController

  get '/components' do
    if !logged_in? then
      redirect_home
    else
      erb :'components/index'
    end
  end

  get '/components/new' do
    if logged_in? then
      @categories = Category.all
      erb :'components/new'
    else
      redirect_home
    end
  end

  post '/components' do
    #raise params.inspect
    if logged_in? then
      if !params[:name].empty? then
        if !params[:category_id].empty? then
          params[:user_id] = current_user.id
          Component.create(params.except(:category))
          flash[:message] = "Component created successfully!"
          redirect_home
        else
          if !params[:category][:name].empty? then
            params[:category_id] = Category.create(params[:category]).id
            params[:user_id] = current_user.id
            Component.create(params.except(:category))
            flash[:message] = "Component and Component Category created successfully!"
            redirect_home
          else
            flash[:message] = "Please specify a component category!"
            redirect '/components/new'
          end
        end
      else
        flash[:message] = "Please specify a component name!"
        redirect '/components/new'
      end
    else
      flash[:message] = "You need to log in first!"
      redirect_home
    end
  end

  get '/components/:id' do
    if logged_in? then
      @component = Component.find(params[:id])
      if current_user.devices.collect{|device| device.id}.include?(@component.device.id) then
        erb :'components/show'
      else
        flash[:message] = "You cannot view this component!"
        redirect_home
      end
    else
      redirect_home
    end
  end

end
