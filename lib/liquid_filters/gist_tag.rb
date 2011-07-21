require 'rest-client'
require 'json'

module LiquidFilters
  class GistTag < Liquid::Tag
    def initialize(tag_name, text, token)
      super
      @text = text
    end

    def render(context)
      if parts = @text.match(/([\d]*) (.*)/)
        gist, file = parts[1].strip, parts[2].strip
        get_raw_gist(gist, file) + get_styles_url
      else
        raise "Wrong parameter format"
      end
    end

    private
    def get_json_url(gist, file)
      "https://gist.github.com/#{gist}.json?file=#{file}"
    end

    def get_raw_gist(gist, file)
      json = RestClient.get(get_json_url(gist, file))
      JSON.load(json)['div']
    end

    def get_styles_url
      "<link rel='stylesheet' href='https://gist.github.com/stylesheets/gist/embed.css'>"
    end
  end

  Liquid::Template.register_tag('gist', LiquidFilters::GistTag)
end