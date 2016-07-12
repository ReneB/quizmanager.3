require 'rails_helper'

RSpec.describe "ContentImages", type: :request do
  describe "GET /content_images" do
    it "works! (now write some real specs)" do
      get content_images_path
      expect(response).to have_http_status(200)
    end
  end
end
