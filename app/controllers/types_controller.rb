class TypesController < ApplicationController

  get '/types/new' do
    if logged_in? then
      erb :'types/new'
    else
      redirect_home
    end
  end

  get '/types/:id' do

  end

  post '/types/' do

  end

  get '/types/:id/edit' do

  end

  patch '/types/:id' do

  end

  delete '/types/:id/delete' do

  end

end
