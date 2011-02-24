module Haml::Filters::EscapedMarkdown
  include Haml::Filters::Base
  lazy_require 'rdiscount'

  def render(text)
    #TODO: Figure out how to chain onto the existing HAML filters
    html = RDiscount.new(text).to_html
    Haml::Helpers.html_escape html
  end
end