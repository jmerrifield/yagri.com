require 'bundler'
Bundler.require

require 'capybara/cucumber'
require File.dirname(__FILE__) + '/../../lib/yagri'
Capybara.app = App
