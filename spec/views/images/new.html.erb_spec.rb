require 'spec_helper'

describe "images/new" do
  before(:each) do
    assign(:image, stub_model(Image).as_new_record)
  end

  it "renders new image form" do
    render

    assert_select "form[action=?][method=?]", images_path, "post" do
    end
  end
end
