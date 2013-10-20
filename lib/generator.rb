class SiteGenerator

  def initialize
    @posts=Posts.all
    self.run
  end

  def generate
    generate_index
    generate_posts
  end

  def generate_index
    create_page("index.html", "index.html.erb")
  end

  def generate_posts
    @posts.each do |post|
      create_page("posts/#{post.name}")
    end
  end

  def create_page(template, html)
    erb = ERB.new(File.open("lib/views/#{template}").read)
    File.open("_site/#{html}", "w+") do |f|
      f<<erb.result(binding)
    end
  end

  def run
    generate
  end

end