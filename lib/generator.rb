class SiteGenerator
  attr_accessor :posts

  def initialize
    @posts=Cartoon.all
  end

  def generate
    generate_index
    generate_posts
  end

  def generate_index
    create_page("index.html", "index.html.erb")
  end

  def draw
    @post=Cartoon.all[3]
    create_page("posts/will-draw.html", "post.erb.html")
  end

  def generate_posts
    @posts.each do |post|
      @post=post
      create_page("posts/#{post.href}", "post.erb.html")
    end
  end

  def create_from_erb(template)
    ERB.new(File.open("lib/views/#{template}").read)
  end

  def create_page(html, template)
    File.open("_site/#{html}", "w+") do |f|
      f<<create_from_erb(template).result(binding)
    end
  end

  def run
    generate
  end

end

# :title, :href, :image_path, :filename