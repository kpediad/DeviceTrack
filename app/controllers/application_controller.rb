class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    use Rack::Flash
    enable :sessions
    set :session_secret, "b348aad8ff570de44f9420fe4a82c74fad58785afe41e1e7afd1a8c05eb5948b869f1919f5849b00705a7cb605f4fd2eb3c1896112cd3c618c73c4cf786b0ff3"
  end

  helpers do

    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end

    def redirect_home
      redirect '/'
    end
  end

  get '/' do
    if !logged_in?
      erb :index, :layout => :'not_logged_in_layout' #=> Log In Page
    else
      redirect '/devices'
    end
  end

end
