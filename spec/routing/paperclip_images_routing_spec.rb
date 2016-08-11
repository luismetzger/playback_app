require "rails_helper"

RSpec.describe PaperclipImagesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/paperclip_images").to route_to("paperclip_images#index")
    end

    it "routes to #new" do
      expect(:get => "/paperclip_images/new").to route_to("paperclip_images#new")
    end

    it "routes to #show" do
      expect(:get => "/paperclip_images/1").to route_to("paperclip_images#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/paperclip_images/1/edit").to route_to("paperclip_images#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/paperclip_images").to route_to("paperclip_images#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/paperclip_images/1").to route_to("paperclip_images#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/paperclip_images/1").to route_to("paperclip_images#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/paperclip_images/1").to route_to("paperclip_images#destroy", :id => "1")
    end

  end
end
