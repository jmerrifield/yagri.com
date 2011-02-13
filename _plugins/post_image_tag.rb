module Jekyll
  class PostImageTag < Liquid::Tag
    # Convention based image locator for posts
    # If both a full sized and resized image are present, render the resized image that links to the full size one

    def initialize(tag_name, img_name, tokens)
      super
      @img_name = img_name
    end

    def render(context)
      page_url = context['page']['url']
      images_dir = File.join(context.registers[:site].source, 'images')

      full_size_file = "#{page_url[1..-1].gsub('/', '-')}-#{@img_name}".rstrip
      unless (File.exist? File.join(images_dir, full_size_file))
        return "File '#{full_size_file}' not found in '#{images_dir}'."
      end

      resized_file = full_size_file.gsub(/\.(.+)$/, '.resized.\1')
      full_size_url = get_image_url(full_size_file, context)
      unless(File.exist? File.join(images_dir, resized_file))
        return "<img src='#{full_size_url}' />"
      end

      resized_url = get_image_url(resized_file, context)
      return "<a href='#{full_size_url}'><img src='#{resized_url}' /></a>"
    end

    private
    def get_image_url(img_file, context)
      root = context['site']['root']
      return "#{root}/images/#{img_file}"
    end
  end
end

Liquid::Template.register_tag('post_image', Jekyll::PostImageTag)