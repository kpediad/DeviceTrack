class DevicesController < ApplicationController

  get '/devices' do
    if !logged_in? then
      redirect_home
    else
      erb :'devices/index'
    end
  end

end
