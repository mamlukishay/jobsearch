
def is_match?(str, pattern)
	# traverse str from end to beginning, pattern parallerly, char by char, first pattern than str
	# if pattern char not '*' and <> str char, return false
	# if pattern char == str char, mark 'has_match' and continue
	# if pattern char is '*', "eat" all consequtive str chars with the same value (take the index back as needed)
	# if reached end of pattern, reutrn has_match

	return true if pattern == '*'
	match_and_advance(str, pattern, str.length - 1, pattern.length - 1)
end

def match_and_advance(str, pattern, str_index, p_index)
	has_match = false
	p_char = pattern[p_index]
	str_char = str[str_index]

	while p_index >= 0 
		case p_char
		when '*'
			p_index -= 1
			p_char = pattern[p_index]

			if p_char == str_char
				has_match = true
				str_index = move_to_first_like(str_char, str: str, starting_from: str_index)
			else
				has_match = false
				break
			end
		when str_char
			has_match = true
		else
			has_match = false
			break
		end
		
		p_index -= 1
		str_index -= 1
	end

	has_match = has_match && str_index < 0
end

def find_last_char_like(str, char_to_find)
	i = str.length - 1
	
	while i >= 0 && str[i] <> char_to_find
		i =- 1
	end

	i
end

def move_to_first_like(char, str:, starting_from:)
	i = starting_from

	while i >= 0 && str[i] == char
		i =- 1
	end

	i + 1
end

# aa, a -> false
# aa, aaa -> false
# aabbb, aa*b*c -> true