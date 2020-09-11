require 'sinatra'

class App < Sinatra::Base

  set :static, true
  enable :sessions, :method_override

  get '/' do
    redirect '/set'
  end

  get '/set' do
    session[:hash] = { params[:key] => params[:value] }
    erb :set
  end

  get '/get' do
    @value = session[:hash][params[:key]] || "nil"
    erb :get
  end

end
