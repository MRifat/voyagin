ONES = { 0 => 'Zero', 1 => 'One', 2 => 'Two', 3 => 'Three', 4 => 'Four', 5 => 'Five', 6 => 'Six', 7 => 'Seven', 8 => 'Eight', 9 => 'Nine' }
TENS = { 0 => '', 10 => 'Ten', 11 => 'Eleven', 12 => 'Twilve', 13 => 'Thirteen', 14 => 'Fourteen', 15 => 'Fifteen', 16 => 'Sixteen', 17 => 'Seventeen', 18 => 'Eighteen',
         19 => 'Nineteen', 20 => 'Twinty', 30 => 'Thirty', 40 => 'Fourty', 50 => 'Fifty', 60 => 'Sixty', 70 => 'Seventy', 80 => 'Eighty', 90 => 'Ninety' }
HUNDRED = 'Hundred'

def convert(number)
  if number / 10 == 0
    return ONES[number]
  else
    digits = number.to_s.split('').map(&:to_i)
    case digits.length
    when 3
      return get_tens[1..-1] if digits.first == 0
      return ("#{ONES[digits.first]} #{HUNDRED} #{get_tens(digits[1..-1])}").strip.gsub(/\ \ /, ' ')
    when 2
      get_tens(digits)
    end
  end
end

def get_tens(digits)
  if digits.first == 1 || digits.last.zero?
    return TENS[digits.join.to_i]
  else
    return "#{TENS[digits.first * 10]} #{ONES[digits.last]}"
  end
end


puts convert(ARGV[0].to_i)
