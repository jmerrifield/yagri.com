class App < Sinatra::Base
  # Need to set these for static files - http://davidwparker.com/2009/11/13/sinatra-base-static-file-issue/
  set :static, true
  set :public, 'public'

  get '/' do
    posts = Dir.glob(File.dirname(__FILE__) + '/../../_posts/*.markdown').map { |x| Post.new(x) }

    haml :index, :locals => {:posts => posts}
  end

  get '/:year/:month/:day/:slug' do
    filename = File.dirname(__FILE__) + "/../../_posts/" + Post.filename_from_hash(params)
    unless File.exist? filename
      puts "Post with name #{filename} not found"
      pass
    end

    post_content = RDiscount.new(File.read(filename)).to_html
    haml :post, :locals =>{:post => Post.new(filename), :post_content => post_content}
  end
end