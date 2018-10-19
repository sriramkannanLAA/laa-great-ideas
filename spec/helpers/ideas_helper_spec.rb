require 'rails_helper'

RSpec.describe 'Ideas helper' do
  include IdeasHelper
  describe 'Enum to select' do
    it 'should return an array of keys and humanized values' do
      enum = double('enum', keys: ['exceptional_and_complex_cases', 'crime'])
      expect(enum_to_select(enum)).to eq(
        [
          ['Exceptional and complex cases', 'exceptional_and_complex_cases'],
          ['Crime', 'crime']
        ]
      )
    end
  end
end
