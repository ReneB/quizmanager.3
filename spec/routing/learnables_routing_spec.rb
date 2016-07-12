require "rails_helper"

RSpec.describe LearnablesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/learnables").to route_to("learnables#index")
    end

    it "routes to #new" do
      expect(:get => "/learnables/new").to route_to("learnables#new")
    end

    it "routes to #show" do
      expect(:get => "/learnables/1").to route_to("learnables#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/learnables/1/edit").to route_to("learnables#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/learnables").to route_to("learnables#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/learnables/1").to route_to("learnables#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/learnables/1").to route_to("learnables#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/learnables/1").to route_to("learnables#destroy", :id => "1")
    end

  end
end
