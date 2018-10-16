require 'rails_helper'

RSpec.describe Idea, type: :model do
  
  describe "Relations" do
    it { should belong_to(:user) }
  end

  describe "Validations" do
    it { should validate_presence_of(:title) }
  end

  describe "fields which should be enums" do
    it { should define_enum_for(:benefits)}
    it { should define_enum_for(:involvement)}
    it { should define_enum_for(:it_system)}
    it { should define_enum_for(:business_area)}
    it { should define_enum_for(:area_of_interest)}
  end

end
