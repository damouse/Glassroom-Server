require 'spec_helper'

describe MobileApiController do

  describe "GET 'auth'" do
    it "returns http success" do
      get 'auth'
      expect(response).to be_success
    end
  end

end
