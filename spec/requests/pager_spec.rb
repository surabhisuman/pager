require 'rails_helper'

RSpec.describe "Pagers", type: :request do
  
  describe "receive_alert" do

    it "should send alert" do
      post "/alert", :params => {"team_id": 1, "message": "Testing message"}
      body = JSON.parse(response.body)
      expect(body['success']).to eq(true)
    end


    it "should send error when team id is invalid" do
      post "/alert", :params => {"team_id": 2}
      body = JSON.parse(response.body)
      expect(body['success']).to eq(false)
    end

  end
end
