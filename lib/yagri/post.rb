require 'time'

class Post
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