require_relative "../config/environment.rb"

p=FileParser.new
p.parse_cartoons
s=SiteGenerator.new
s.generate_posts
