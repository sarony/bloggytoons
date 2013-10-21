class FileParser
  attr_accessor :cartoon_path, :blog_path

  def initialize
    @cartoon_path=Dir.glob("_site/images/*.png")
    @thumbnail_path=Dir.glob("_site/images/thumnails/*.png")
    @blog_path=Dir.glob("_site/blog-posts/")
  end

  def parse_cartoons
    @cartoon_path.each do |filename|
      c = Cartoon.new.tap do |f| 
        f.filename=filename 
        f.get_assets
      end
    end
  end

  def self.parse_blogs
    @blog_path.each do |filename|
      Blog.new.tap{|f| f.filename=filename}
    end 
  end

  def parse_cartoons
    @thumbnail_path.each do |thumbnail|
      Cartoon.all.each do |cartoon|
        cartoon.thumbail = thumbnail if thumbnail.include?(cartoon.filename.gsub(/(.png)/,"")
      end
    end
  end

end