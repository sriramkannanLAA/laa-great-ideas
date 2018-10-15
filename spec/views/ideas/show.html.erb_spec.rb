require 'rails_helper'

RSpec.describe "ideas/show", type: :view do
  before(:each) do
    @idea = assign(:idea, Idea.create!(
      :area_of_interest => 2,
      :business_area => 3,
      :it_system => 4,
      :title => "Title",
      :idea => "MyText",
      :benefits => 5,
      :impact => "MyText",
      :involvement => 6
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/6/)
  end
end
