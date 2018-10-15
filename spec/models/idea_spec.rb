require 'rails_helper'

RSpec.describe Idea, type: :model do
  describe "Relations" do
    it { should belong_to(:user) }
  end

  describe "Validations" do
    it { should validate_presence_of(:title) }
  end

end
