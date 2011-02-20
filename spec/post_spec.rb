require "rspec"
$LOAD_PATH.unshift(File.dirname(__FILE__) + '/../lib')
require 'yagri/post'

describe "Post" do
  before do
		@post = Post.new("/path/to/posts/2010-06-25-My-Blog-Post.markdown")
  end

  it "should parse the date from the file name" do
    @post.date.should == Date.new(2010, 06, 25)
  end

  it "should parse the post title from the file name" do
    @post.title.should == "My Blog Post"
  end

  it "should generate the post URL from the file name" do
    @post.url.should == "/2010/06/25/My-Blog-Post"
  end
end