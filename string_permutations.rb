


def perms_h(str)
	return [""] if str.empty?
	
	retval = []
	str.each_char do |prefix|
		next_str = str.sub(prefix, "")
		puts "NEXT: #{prefix}, #{next_str}"

		perms_h(next_str).each do |perm|
			retval << prefix + perm
		end
	end
	
	retval
end

p perms = perms_h("abd")
puts "SIZE: #{perms.size}"