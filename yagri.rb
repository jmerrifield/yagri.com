require 'rubygems'
require 'sinatra'
require 'liquid'

get '/' do
  liquid :default_layout, :locals => {:page_content => "Hello world!"}
end