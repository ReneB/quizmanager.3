require 'rails_helper'

RSpec.describe LandingsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to redirect_to(questions_path)
    end
  end

end
