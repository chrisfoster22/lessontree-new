require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe "GET index" do
    it "responds successfully with an HTTP 200 status code" do

      get :index

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do

      get :index

      expect(response).to render_template("index")
    end
  end

  describe "Homepage loads" do
    context "Logged in" do


    end

    context "Not logged in" do

    end
  end
end
