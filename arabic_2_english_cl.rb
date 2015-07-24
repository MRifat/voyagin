require_relative 'arabic_to_english'

number = ArabicToEnglish.new(ARGV[0])
puts number.convert
