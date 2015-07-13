require 'rspec'
require_relative '../arabic_to_english'

describe ArabicToEnglish do
  describe 'converting single digit numbers' do
    it "should return One when when calling convert with 1" do
      a_2_e = ArabicToEnglish.new(1)
      expect(a_2_e.convert).to eq('One')
    end

    it "should return Ten when when calling convert with 10" do
      a_2_e = ArabicToEnglish.new(10)
      expect(a_2_e.convert).to eq('Ten')
    end

    it "should return Fifteen when when calling convert with 15" do
      a_2_e = ArabicToEnglish.new(15)
      expect(a_2_e.convert).to eq('Fifteen')
    end

    it "should return Twinty when when calling convert with 20" do
      a_2_e = ArabicToEnglish.new(20)
      expect(a_2_e.convert).to eq('Twinty')
    end

    it "should return Twinty Five when when calling convert with 25" do
      a_2_e = ArabicToEnglish.new(25)
      expect(a_2_e.convert).to eq('Twinty Five')
    end

  end
end
