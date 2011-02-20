class Post
  def initialize(file_name)
    @file_name = file_name
  end

  def date
    Date.strptime(@file_name[0..9], "%Y-%m-%d")
  end

  def title
    @file_name[11..-10].gsub('-', ' ')
  end
end