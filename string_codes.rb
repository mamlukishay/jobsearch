#  a=1
#  z = 26

require 'set'

def decode(codes, str, indent = 0)
  return [""] if str.empty?
  retval = []
  single_digit_code = str[0] == '0' ? "" : codes[str[0]]
  double_digit_code = str[1] ? codes[str[0..1]] : nil

  puts  "#{'   '*indent} ----- #{str} -----"
  puts "#{'   '*indent} #{str[0]}: #{single_digit_code}"
  puts "#{'   '*indent} #{str[0..1]}: #{double_digit_code}" if double_digit_code

  if single_digit_code
    decode(codes, str[1..(str.length - 1)], indent+1).each do |code|
      retval << (single_digit_code + code)
    end
  end

  if double_digit_code
    decode(codes, str[2..(str.length - 2)], indent+1).each do |code|
      retval << (double_digit_code + code)
    end
  end

  retval
end

def build_codes
  codes = {}
  ('a'..'z').each_with_index do |char, i|
    codes[(i+1).to_s] = char
  end

  codes
end


puts "=========================="
puts decode(build_codes, "2010")