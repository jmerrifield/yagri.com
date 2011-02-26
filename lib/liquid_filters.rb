class Highlight < Liquid::Block
  require 'rest-client'

  def initialize(tag_name, markup, tokens)
    @markup = markup
    super
  end

  def render(context)
    highlight_code super.join
  end

  def highlight_code(code)
    RestClient.post "http://ultraviolence.heroku.com/api?s=#{@markup.strip}&l=0&t=blackboard", code.strip
  end

  # See https://github.com/technoweenie/ultraviolence/issues#issue/2
  # To get around this, replace semicolons with some (hopefully) unused string
  # and put them back in after we've sent it to the formatter
  alias original_highlight_code highlight_code
  private :original_highlight_code

  def highlight_code(code)
    hacked_code = code.gsub(';', 'MAGIC_SEMI')
    highlighted_hacked = original_highlight_code(hacked_code)
    highlighted_hacked.gsub('MAGIC_SEMI', ';')
  end
end

Liquid::Template.register_tag('highlight', Highlight)
