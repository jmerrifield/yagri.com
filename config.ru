$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "lib"))

require 'yagri'
require 'rack/force_domain'
use Rack::ForceDomain, ENV["DOMAIN"]
run App