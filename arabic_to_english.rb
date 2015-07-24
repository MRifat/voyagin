class ArabicToEnglish

  attr_reader :number

  ONES = { 0 => 'Zero', 1 => 'One', 2 => 'Two', 3 => 'Three', 4 => 'Four', 5 => 'Five', 6 => 'Six', 7 => 'Seven', 8 => 'Eight', 9 => 'Nine' }
  TENS = { 0 => '', 10 => 'Ten', 11 => 'Eleven', 12 => 'Twilve', 13 => 'Thirteen', 14 => 'Fourteen', 15 => 'Fifteen', 16 => 'Sixteen', 17 => 'Seventeen', 18 => 'Eighteen',
           19 => 'Nineteen', 20 => 'Twinty', 30 => 'Thirty', 40 => 'Fourty', 50 => 'Fifty', 60 => 'Sixty', 70 => 'Seventy', 80 => 'Eighty', 90 => 'Ninety' }

  HUNDRED = 'Hundred'

  THOUSAND = 'Thousand'

  MILLION = 'Million'

  def initialize(number=[])
    @number ||= number
  end

  def number=(n)
    @number = n
  end



  def convert(minus)
    digits = @number.to_s.split('').map(&:to_i)
    digits.shift if minus
    result = minus ? 'Minus ' : ''
    case digits.length
    when 7, 8, 9
      result += get_millions(digits)
    when 4, 5, 6
      result += get_thousands(digits)
    when 3
      result += get_hundreds(digits)
    when 2
      result += get_tens(digits)
    when 1
      result += get_ones(digits[-1])
    end
    return result.strip.gsub(/\ \ /, ' ')
  end

  def get_ones(number)
    return ONES[number]
  end

  def get_tens(digits)
    if digits[-2] == 1 || digits.last.zero?
      return TENS[digits[-2..-1].join.to_i]
    else
      return "#{TENS[digits[-2] * 10]} #{ONES[digits.last]}"
    end
  end

  def get_hundreds(digits)
    tens = "#{get_tens(digits)}"
    tens = 'and ' + tens unless tens.empty?
    return tens if digits[-3] == 0
    return ("#{get_ones(digits[-3])} #{HUNDRED} #{tens}")
  end

  def get_thousands(digits)
    hundreds = get_hundreds(digits)
    return ("#{get_hundreds(digits[-6..-4])} #{THOUSAND} #{hundreds}") unless digits[-6].nil?
    return ("#{get_tens(digits[-5..-4])} #{THOUSAND} #{hundreds}") unless digits[-5].nil?
    return hundreds(digits) if digits[-4] == 0
    return ("#{get_ones(digits[-4])} #{THOUSAND} #{hundreds}")
  end

  def get_millions(digits)
    thousands = get_thousands(digits[-6..-1])
    return ("#{get_tens(digits[-8..-7])} #{MILLION} #{thousands}") unless digits[-8].nil?
    return ("#{get_ones(digits[-7])} #{MILLION} #{thousands}")
  end
end
