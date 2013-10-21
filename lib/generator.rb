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
    @header = ERB.new(File.open('lib/views/_header.erb.html').read).result(binding)
    @footer = ERB.new(File.open('lib/views/_footer.erb.html').read).result(binding)
    create_page("index.html", "index.erb.html")
    
  end

  def generate_posts
    @posts.each do |post|
      @post=post
      @header = ERB.new(File.open('lib/views/_header.erb.html').read).result(binding)
      create_page("posts/#{post.href}", "post.erb.html")
      @footer = ERB.new(File.open('lib/views/_footer.erb.html').read).result(binding)
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