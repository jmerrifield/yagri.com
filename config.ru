require 'rubygems'
require 'sinatra'
require 'liquid'
require File.join(File.dirname(__FILE__), 'yagri')

configure(:development) do |c|
  require "sinatra/reloader"
  c.also_reload "*.rb"
end

run Sinatra::Application