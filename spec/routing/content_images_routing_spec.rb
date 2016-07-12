require "rails_helper"

RSpec.describe ContentImagesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/content_images").to route_to("content_images#index")
    end

    it "routes to #new" do
      expect(:get => "/content_images/new").to route_to("content_images#new")
    end

    it "routes to #show" do
      expect(:get => "/content_images/1").to route_to("content_images#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/content_images/1/edit").to route_to("content_images#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/content_images").to route_to("content_images#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/content_images/1").to route_to("content_images#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/content_images/1").to route_to("content_images#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/content_images/1").to route_to("content_images#destroy", :id => "1")
    end

  end
end
