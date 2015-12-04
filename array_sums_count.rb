
def count(arr, a, b)
	arr = arr.sort {|x| x}
	from, to = 0, arr.size - 1
	from_is_set = false
	sum = 0

	arr.each_with_index do |item, i|
		if item < a 
			from = i+1 
		sum += item
		
		if sum < b
			next
		else
			to = i - 1
			break
		end
	end

	p "from: #{from}, to: #{to}"

	sum_roots = to - from + 1
	(1..sum_roots).inject(:*)
end


puts count [1,2,3], 0, 3
puts count [-2, 5, -1], -2, 2	