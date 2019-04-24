class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    use Rack::Flash
    enable :sessions
    set :session_secret, "b348aad8ff570de44f9420fe4a82c74fad58785afe41e1e7afd1a8c05eb5948b869f1919f5849b00705a7cb605f4fd2eb3c1896112cd3c618c73c4cf786b0ff3"
  end

  get '/' do
    "Hello, World!!!"
  end

end
