require "spec_helper.rb"

  describe 'Cartoon' do 
    let(:cartoon){Cartoon.new.tap{|f|f.filename="_site/images/git-kitchen-chef.png"}}

    describe ".set_image_path" do
      it "sets the path for the image src" do
        cartoon.set_image_path.should eq("images/git-kitchen-chef.png")
      end
    end

    describe ".set_title" do
      it "sets the title for the blog post" do
        cartoon.set_image_path
        cartoon.set_title.should eq("Git Kitchen Chef")
      end
    end

    describe ".set_href" do
      it "creates the href link for the html page" do
        cartoon.set_image_path
        cartoon.set_href.should eq("git-kitchen-chef.html")
      end
    end

    describe "self.reset" do
      it "clears the cartoons array" do
        Cartoon.reset
        Cartoon.all.should eq([])
      end
    end

    describe ".get_assets" do 
      it "should create all three assets" do
        Cartoon.reset
        Cartoon.all.should eq([])
        cartoon.get_assets
        cartoon.image_path.should eq("images/git-kitchen-chef.png")
        cartoon.set_href.should eq("git-kitchen-chef.html")
        cartoon.set_title.should eq("Git Kitchen Chef")
      end
    end
    
  end





