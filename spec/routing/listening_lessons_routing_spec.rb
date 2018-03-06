require "rails_helper"

RSpec.describe ListeningLessonsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/listening_lessons").to route_to("listening_lessons#index")
    end

    it "routes to #new" do
      expect(:get => "/listening_lessons/new").to route_to("listening_lessons#new")
    end

    it "routes to #show" do
      expect(:get => "/listening_lessons/1").to route_to("listening_lessons#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/listening_lessons/1/edit").to route_to("listening_lessons#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/listening_lessons").to route_to("listening_lessons#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/listening_lessons/1").to route_to("listening_lessons#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/listening_lessons/1").to route_to("listening_lessons#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/listening_lessons/1").to route_to("listening_lessons#destroy", :id => "1")
    end

  end
end
