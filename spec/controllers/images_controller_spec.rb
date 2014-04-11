require 'spec_helper'
describe ImagesController do

  describe "GET 'edit'" do
    it "returns http success" do
      get 'edit'
      expect(response).to be_success
    end
  end

  describe "GET 'change_order'" do
    it "returns http success" do
      get 'change_order'
      expect(response).to be_success
    end
  end

  describe "GET 'sort_order'" do
    it "returns http success" do
      get 'sort_order'
      expect(response).to be_success
    end
  end

  describe "GET 'update'" do
    it "returns http success" do
      get 'update'
      expect(response).to be_success
    end
  end

  describe "GET 'delete'" do
    it "returns http success" do
      get 'delete'
      expect(response).to be_success
    end
  end

end
