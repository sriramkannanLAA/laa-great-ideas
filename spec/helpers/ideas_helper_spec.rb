require 'rails_helper'
include IdeasHelper

RSpec.describe "Ideas helper" do
  describe "Enum to select" do
    it "should return an array of keys and humanized values" do
      area = enum_to_select(Idea.business_areas).select{ |h, k| k == "exceptional_and_complex_cases"}
      expect(area[0][0]).to eq("Exceptional and complex cases")
    end
  end
end
