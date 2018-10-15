require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Relations" do
    it { should have_many(:ideas) }
  end

  describe "Validations" do
    it { should validate_presence_of(:email) }
  end
end
