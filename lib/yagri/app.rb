class App < Sinatra::Base
  # Need to set these for static files - http://davidwparker.com/2009/11/13/sinatra-base-static-file-issue/
  set :static, true
  set :public, 'public'

  def get_posts
    posts = Dir.glob(File.dirname(__FILE__) + '/../../_posts/*.markdown').
        map { |x| Post.new(x) }.
        sort { |a, b| b.date <=> a.date }
    posts
  end

  get '/' do
    haml :index, :locals => {:posts => get_posts}
  end

  get '/:year/:month/:day/:slug' do
    filename = File.dirname(__FILE__) + "/../../_posts/" + Post.filename_from_hash(params)
    unless File.exist? filename
      puts "Post with name #{filename} not found"
      pass
    end

    haml :post, :locals =>{:post => Post.new(filename)}
  end

  get '/atom' do
    haml :atom, :layout => false, :locals => {:posts => get_posts}, :escape_html => true
  end
end