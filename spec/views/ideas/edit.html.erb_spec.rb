require 'rails_helper'

RSpec.describe "ideas/edit", type: :view do
  before(:each) do
    @idea = assign(:idea, Idea.create!(
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

  it "renders the edit idea form" do
    render

    assert_select "form[action=?][method=?]", idea_path(@idea), "post" do

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
