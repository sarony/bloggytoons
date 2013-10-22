require_relative "../config/environment.rb"

p=FileParser.new
p.parse_cartoons
p.parse_thumbnails
s=SiteGenerator.new
s.generate_posts
s.generate_index
