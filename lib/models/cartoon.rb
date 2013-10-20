class Cartoon
attr_accessor :title, :href, :image_path, :filename

@@cartoons = []

  def initialize
    @@cartoons << self
    get_assets
  end

  def get_assets
    self.set_image_path
    self.set_title
    self.set_href
  end

  def set_image_path
    self.image_path = self.filename.split("/", 2).last
  end

  def set_title
    self.title = self.image_path.split("/").last.match(/^([^.]+)/).to_s.split("-").collect{|i|i.capitalize}.join(" ")
  end

  def set_href
    self.href = self.image_path.gsub(/(images)/, "").delete("/").gsub(/(png)/,"html")
  end

  def get_images
      image.thumbnail = ""
  end 

  def self.all
    @@cartoons
  end

  def self.reset
    @@cartoons.clear
  end

end