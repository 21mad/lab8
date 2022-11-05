require 'rails_helper'

RSpec.describe "Tasks", type: :request do
  describe "GET /input" do
    it "returns http success" do
      get root_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/task/show"
      expect(response).to have_http_status(:success)
    end
  end

end
