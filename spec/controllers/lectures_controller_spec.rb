require 'spec_helper'

describe LecturesController do

  describe "GET 'lectures'" do
    it "returns http success" do
      get 'lectures'
      expect(response).to be_success
    end
  end

  describe "GET 'lecture_viewer'" do
    it "returns http success" do
      get 'lecture_viewer'
      expect(response).to be_success
    end
  end

end
