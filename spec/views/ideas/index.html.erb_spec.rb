require 'rails_helper'

RSpec.describe "ideas/index", type: :view do
  before(:each) do
    assign(:ideas, [
      Idea.create!(
        :area_of_interest => 2,
        :business_area => 3,
        :it_system => 4,
        :title => "Title",
        :idea => "MyText",
        :benefits => 5,
        :impact => "MyText",
        :involvement => 6
      ),
      Idea.create!(
        :area_of_interest => 2,
        :business_area => 3,
        :it_system => 4,
        :title => "Title",
        :idea => "MyText",
        :benefits => 5,
        :impact => "MyText",
        :involvement => 6
      )
    ])
  end

  it "renders a list of ideas" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 6.to_s, :count => 2
  end
end
