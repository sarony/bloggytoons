class Cartoon
attr_accessor :title, :href, :image_path, :filename, :thumbnail

@@cartoons = []

  def initialize
    @@cartoons << self
  end

  def get_assets
    self.path
    self.set_image_path
    self.set_title
    self.set_href
  end

  def path
    @path = self.filename.split("/", 2).last
  end

  def set_image_path
    self.image_path = "../#{self.filename.split("/", 2).last}"
  end

  def set_title
    self.title = self.path.split("/").last.match(/^([^.]+)/).to_s.split("-").collect{|i|i.capitalize}.join(" ")
  end

  def set_href
    self.href = self.path.gsub(/(images)/, "").delete("/").gsub(/(png)/,"html")
  end

  def self.all
    @@cartoons
  end

  def self.reset
    @@cartoons.clear
  end

end