class App < Sinatra::Base
  get '/' do
    liquid :index
  end
end