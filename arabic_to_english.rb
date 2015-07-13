class ArabicToEnglish

  attr_reader :number

  ONES = { 0 => "Zero", 1 => "One", 2 => "Two", 3 => "Three", 4 => "Four", 5 => "Five", 6 => "Six", 7 => "Seven", 8 => "Eight", 9 => "Nine" }
  TENS = { 10 => "Ten", 11 => "Eleven", 12 => "Twilve", 13 => "Thirteen", 14 => "Fourteen", 15 => "Fifteen", 16 => "Sixteen", 17 => "Seventeen", 18 => "Eighteen",
           19 => "Nineteen", 20 => 'Twinty', 30 => 'Thirty', 40 => 'Fourty', 50 => 'Fifty', 60 => 'Sixty', 70 => 'Seventy', 80 => 'Eighty', 90 => 'Ninety' }

  def initialize(number)
    @number ||= number
  end

  def convert
    if @number / 10 == 0
      return ONES[@number]
    elsif @number / 10 == 1
      return TENS[@number]
    elsif @number / 10 == 2
      digits = @number.to_s.split('').map(&:to_i)
      return digits.last.zero? ? TENS[@number] : TENS[20] << " #{ONES[digits.last]}"
    end
  end
end
