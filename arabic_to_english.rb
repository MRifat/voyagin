class ArabicToEnglish

  attr_reader :number

  ONES = { 0 => "Zero", 1 => "One", 2 => "Two", 3 => "Three", 4 => "Four", 5 => "Five", 6 => "Six", 7 => "Seven", 8 => "Eight", 9 => "Nine" }

  def initialize(number)
    @number ||= number
  end

  def convert
    if @number / 10 == 0
      return ONES[@number]
    end
  end
end
