class Highlight < Liquid::Block
  require 'rest-client'

  def initialize(tag_name, markup, tokens)
    super
  end

  def render(context)
    highlight_code super.join
  end

  def highlight_code(code)
    RestClient.post "http://ultraviolence.heroku.com/api?s=html_for_asp.net&l=0&t=blackboard", code
  end
end

Liquid::Template.register_tag('highlight', Highlight)
