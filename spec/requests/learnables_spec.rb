require 'rails_helper'

RSpec.describe "Learnables", type: :request do
  describe "GET /learnables" do
    it "works! (now write some real specs)" do
      get learnables_path
      expect(response).to have_http_status(200)
    end
  end
end
