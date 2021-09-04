require 'rails_helper'

RSpec.describe "Teams", type: :request do
  # describe "GET /index" do
  #   pending "add some examples (or delete) #{__FILE__}"
  # end

  describe "map_developer" do

    it "should return error for incorrect params" do
      post "/map_developer", :params => {}
      body = JSON.parse(response.body)
      expect(body['success']).to eq(false)
    end

    it "should create new developers" do
      post "/map_developer", :params => {"team": {"name": "claims"}, "developers": [{"name": "someone", "phone_number":
      "9999999999"}, {"name": "somebody", "phone_number": "9111111111"}]}
      body = JSON.parse(response.body)
      expect(body['success']).to eq(true)
    end

  end

end
