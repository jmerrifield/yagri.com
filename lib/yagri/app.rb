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
    page_info = { title: 'Home Page | yagri.com' }
    haml :index, :locals => { :posts => get_posts, :page_info => page_info }
  end

  get '/:year/:month/:day/:slug' do
    filename = File.dirname(__FILE__) + "/../../_posts/" + Post.filename_from_hash(params)
    unless File.exist? filename
      puts "Post with name #{filename} not found"
      pass
    end

    post = Post.new(filename)
    page_info = { title: "#{post.title} | yagri.com",
        canonical_href: post.url }

    haml :post, :locals =>{ :post => post, :page_info => page_info }
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

  get '/yagri/blog/post.aspx' do
    status, headers, body = call env.merge("PATH_INFO" => '/blog/post.aspx')
    [status, headers, body]
  end

  get '/blog/post.aspx' do
    # Preserve old permalinks from the BlogEngine.net days
    redirects = { 
        '4858c45d-cf3d-4d96-8bea-7c4ede768e2b' => '/2010/01/26/Jon-starts-a-tech-blog',
        'c9c54a9f-927b-4908-be18-5391e6945304' => '/2010/01/27/Form-Control-Naming-Conventions',
        'd4b48f48-1bb9-4519-988f-c8ebf56638dd' => '/2010/01/29/LINQ-to-SQL-Unspecified-Error-and-missing-designer-file',
        'd23719a1-8bfc-48e1-9896-c7c185ae3479' => '/2010/02/01/Visualising-Complex-Structures-With-GraphViz',
        '59da6dcd-9072-4e83-93f9-098f0e3aed48' => '/2010/02/17/Readable-String-Concatenation',
        '3a008a6f-82ac-44c1-9bb3-771f1abbf2fc' => '/2010/03/09/Rendering-Text-with-ASP.NET',
    }

    pass unless redirects.has_key? params[:id]
    redirect redirects[params[:id]], 301
  end

  get '/yagri/blog/post/:year/:month/:day/:slug.aspx' do |year, month, day, slug|
    status, headers, body = call env.merge("PATH_INFO" => "/blog/post/#{year}/#{month}/#{day}/#{slug}.aspx")
    [status, headers, body]
  end

  get '/blog/post/:year/:month/:day/:slug.aspx' do |year, month, day, slug|
    # Preserve old .aspx links from the BlogEngine.net days
    post = Post.post_for_date(year, month, day)
    redirect post.url, 301
  end
end
