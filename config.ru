$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "lib"))

require 'yagri'

configure(:development) do |c|
  require "sinatra/reloader"
  c.also_reload "*.rb"
end

run App