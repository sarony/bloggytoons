class FileParser
  attr_accessor :cartoon_path, :blog_path, :thumbnail_path

  def initialize
    @cartoon_path=Dir.glob("_site/images/*.png")
    @thumbnail_path=Dir.glob("_site/images/thumbnails/*.png")
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

  def parse_thumbnails
    @thumbnail_path.each do |thumbnail|
      Cartoon.all.each do |cartoon|
        cartoon.thumbnail = thumbnail if thumbnail.include?(cartoon.path.split("/").last)
      end
    end
  end

end