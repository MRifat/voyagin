require_relative '../arabic_to_english'

describe ArabicToEnglish do

  describe 'converting single digit numbers' do
    it "should return One when calling convert with 1" do
      expect(ArabicToEnglish.new(1).convert).to eq('One')
    end
  end

  describe 'converting double digit numbers' do

    before(:each) do
      @a_2_e = ArabicToEnglish.new
    end

    it "should return Ten when calling convert with 10" do
      @a_2_e.number = 10
      expect(@a_2_e.convert).to eq('Ten')
    end

    it "should return Fifteen when calling convert with 15" do
      @a_2_e.number = 15
      expect(@a_2_e.convert).to eq('Fifteen')
    end

    it "should return Twinty when calling convert with 20" do
      @a_2_e.number = 20
      expect(@a_2_e.convert).to eq('Twinty')
    end

    it "should return Twinty Five when calling convert with 25" do
      @a_2_e.number = 25
      expect(@a_2_e.convert).to eq('Twinty Five')
    end

  end

  describe 'converting triple digit numbers' do

    before(:each) do
      @a_2_e = ArabicToEnglish.new
    end

    it "should return One Hundred when calling convert with 100" do
      @a_2_e.number = 100
      expect(@a_2_e.convert).to eq('One Hundred')
    end

    it "should return One Hundred Five when calling convert with 105" do
      @a_2_e.number = 105
      expect(@a_2_e.convert).to eq('One Hundred and Five')
    end

    it "should return One Hundred Twilve when calling convert with 112" do
      @a_2_e.number = 112
      expect(@a_2_e.convert).to eq('One Hundred and Twilve')
    end

    it "should return Two Hundred Twinty when calling convert with 220" do
      @a_2_e.number = 220
      expect(@a_2_e.convert).to eq('Two Hundred and Twinty')
    end

  end

end
