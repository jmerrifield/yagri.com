class Post
  def initialize(file_name)
    @file_name = File.basename(file_name)
  end

  def date
    Date.strptime(@file_name[0..9], "%Y-%m-%d")
  end

  def title
    raw_filename().gsub('-', ' ')
  end

  def url
    date.strftime("/%Y/%m/%d") + "/" + raw_filename
  end

  private
  def raw_filename
    @file_name[11..-10]
  end
end