require "rspec"
$LOAD_PATH.unshift(File.dirname(__FILE__) + '/../lib')
require 'yagri/post'

describe "Post" do
  before do
    @post = Post.new("/some/path/we/dont/care/about/2010-06-25-My-Blog-Post.markdown")
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

  it "should figure out it's file name from pieces of a URL" do
    filename = Post.filename_from("2010", "06", "25", "My-Blog-Post")
    filename.should == "2010-06-25-My-Blog-Post.markdown"
  end

  it "should figure out it's file name from a parameter hash" do
    params = {
        :year =>"2010",
        :month =>"06",
        :day => "25",
        :slug =>"My-Blog-Post"
    }

    Post.filename_from_hash(params).should == "2010-06-25-My-Blog-Post.markdown"
  end
end