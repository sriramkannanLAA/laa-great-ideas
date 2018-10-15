require 'rails_helper'

RSpec.describe "ideas/new", type: :view do
  before(:each) do
    assign(:idea, Idea.new(
      :area_of_interest => 1,
      :business_area => 1,
      :it_system => 1,
      :title => "MyString",
      :idea => "MyText",
      :benefits => 1,
      :impact => "MyText",
      :involvement => 1
    ))
  end

  it "renders new idea form" do
    render

    assert_select "form[action=?][method=?]", ideas_path, "post" do

      assert_select "input[name=?]", "idea[area_of_interest]"

      assert_select "input[name=?]", "idea[business_area]"

      assert_select "input[name=?]", "idea[it_system]"

      assert_select "input[name=?]", "idea[title]"

      assert_select "textarea[name=?]", "idea[idea]"

      assert_select "input[name=?]", "idea[benefits]"

      assert_select "textarea[name=?]", "idea[impact]"

      assert_select "input[name=?]", "idea[involvement]"
    end
  end
end
