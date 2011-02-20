class App < Sinatra::Base
  # Need to set these for static files - http://davidwparker.com/2009/11/13/sinatra-base-static-file-issue/
  set :static, true
  set :public, 'public'

  get '/' do
    posts = Dir.glob(File.dirname(__FILE__) + '/../../_posts/*.markdown').map { |x| Post.new(x) }

    haml :index, :locals => {:posts => posts}
  end
end