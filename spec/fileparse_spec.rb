require "spec_helper.rb"

  describe 'FileParser' do 
    let(:p){FileParser.new}
    let(:c){Cartoon.all.first}

    describe ".thumbnail_path" do
      it "gets the path for all of the thumbnails" do
        p.thumbnail_path.should include("_site/images/thumbnails/thumb-git-kitchen-with-chef-ramsay.png")
      end
    end

    describe ".parse_thumbnails" do
      it "parse the thumbnails" do
        p.parse_thumbnails
        c.filename.should eq("_site/images/git-kitchen-with-chef-ramsay.png")
        c.thumbnail.should eq("_site/images/thumbnails/thumb-git-kitchen-with-chef-ramsay.png")
      end
    end


  end