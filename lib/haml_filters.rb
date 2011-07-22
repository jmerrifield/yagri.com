module Haml::Filters::EscapedMarkdown
	include Haml::Filters::Base
	require 'liquid'
	require 'rdiscount'

	def render(text)
		md = Liquid::Template.parse(text).render()
		Haml::Helpers.html_escape RDiscount.new(md).to_html
	end
end

module Haml::Filters::LiquidMarkdown
	include Haml::Filters::Base
	require 'liquid'
	require 'rdiscount'

	def render(text)
		md = Liquid::Template.parse(text).render()
		RDiscount.new(md).to_html
	end
end