class Post
  def initialize(file_name)
    @file_name = File.basename(file_name)
  end

  def date
    Time.parse(@file_name[0..9], "%Y-%m-%d")
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

  private
  def raw_filename
    @file_name[11..-10]
  end
end