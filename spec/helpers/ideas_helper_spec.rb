require 'rails_helper'

RSpec.describe 'Ideas helper' do
  include IdeasHelper
  describe 'Enum to select' do
    it 'should return an array of keys and humanized values' do
      enum1 = double('enum')
      allow(enum1).to receive(:fetch).and_return(
        'exceptional_and_complex_cases' => 0,
        'crime' => 1
      )
      expect(enum_to_select(enum1.fetch)).to eq(
        [
          ['Exceptional and complex cases', 'exceptional_and_complex_cases'],
          ['Crime', 'crime']
        ]
      )
    end
  end
end
