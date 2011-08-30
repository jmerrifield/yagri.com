class App < Sinatra::Base
  # Need to set these for static files - http://davidwparker.com/2009/11/13/sinatra-base-static-file-issue/
  set :static, true
  set :public, 'public'
  Post.base_dir = File.join(File.dirname(__FILE__), '../../_posts')

  def get_posts
    posts = Dir.glob(File.dirname(__FILE__) + '/../../_posts/*.markdown').
        map { |x| Post.new(x) }.
        sort { |a, b| b.date <=> a.date }
    posts
  end

  get '/' do
    page_title = 'Home Page | yagri.com'
    haml :index, :locals => { :posts => get_posts, :page_title => page_title }
  end

  get '/:year/:month/:day/:slug' do
    filename = File.dirname(__FILE__) + "/../../_posts/" + Post.filename_from_hash(params)
    unless File.exist? filename
      puts "Post with name #{filename} not found"
      pass
    end

    post = Post.new(filename)
    page_title = "#{post.title} | yagri.com"
    haml :post, :locals =>{ :post => post, :page_title => page_title }
  end

  get '/atom' do
    haml :atom, :layout => false, :locals => { :posts => get_posts }, :escape_html => true
  end

  get '/blog/?' do
    redirect '/', 301
  end

  get '/blog/syndication.axd' do
    redirect '/atom', 301
  end

  get '/blog/post/:year/:month/:day/:slug.aspx' do
    post = Post.post_for_date(params[:year], params[:month], params[:day])
    redirect post.url, 301
  end
end