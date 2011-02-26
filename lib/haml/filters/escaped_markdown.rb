module Haml::Filters::EscapedMarkdown
  include Haml::Filters::Base
  require 'rdiscount'

  def render(text)
    Haml::Helpers.html_escape RDiscount.new(text).to_html
  end
end