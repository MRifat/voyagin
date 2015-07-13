require 'rspec'
require_relative '../arabic_to_english'

describe ArabicToEnglish do
  describe 'converting single digit numbers' do
    it "should return One when when calling convert with 1" do
      a_2_e = ArabicToEnglish.new(1)
      expect(a_2_e.convert).to eq('One')
    end
  end
end
