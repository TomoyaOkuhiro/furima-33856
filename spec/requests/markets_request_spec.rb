require 'rails_helper'

RSpec.describe "Markets", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/markets/index"
      expect(response).to have_http_status(:success)
    end
  end

end
