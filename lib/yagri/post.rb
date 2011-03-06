require 'time'

class Post
  class <<self
    attr_accessor :base_dir

    def post_for_date(year, month, day)
      raise "Set the base_dir first!" if @base_dir.nil?

      post_filter = File.join(@base_dir, "#{year}-#{month}-#{day}-*.markdown")
      puts "Looking for files matching '#{post_filter}'"
      posts = Dir.glob(post_filter)

      raise "More than 1 post found for that date!" if posts.length > 1
      raise "No post found for that date!" if posts.empty?

      Post.new(File.join(@base_dir, posts[0]))
    end
  end

  def initialize(file_name)
    @file_name = file_name
  end

  def date
    Time.parse(filename_nodir[0..9], "%Y-%m-%d")
  end

  def title
    raw_filename().gsub('-', ' ')
  end

  def url
    date.strftime("/%Y/%m/%d") + "/" + raw_filename
  end

  def self.filename_from(year, month, day, slug)
    "#{year}-#{month}-#{day}-#{slug}.markdown"
  end

  def self.filename_from_hash(h)
    filename_from(h[:year], h[:month], h[:day], h[:slug])
  end

  def uniqueref
    "post_#{date.strftime('%Y_%m_%d')}"
  end

  def content
    File.read(@file_name)
#    RDiscount.new(File.read(@file_name)).to_html
  end

  private
  def filename_nodir
    File.basename @file_name
  end

  def raw_filename
    filename_nodir[11..-10]
  end
end