module LiquidFilters
  class GistTag < Liquid::Tag
    def initialize(tag_name, text, token)
      super
      @text = text
    end

    def render(context)
      if parts = @text.match(/([\d]*) (.*)/)
        gist, file = parts[1].strip, parts[2].strip
        "<script src=\"https://gist.github.com/#{gist}.js?file=#{file}\"></script>"
      else
        raise "Wrong parameter format"
      end
    end
  end

  Liquid::Template.register_tag('gist', LiquidFilters::GistTag)
end