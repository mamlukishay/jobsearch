def merge_sort(arr)
	return arr if arr.size <= 1

	m = arr.size / 2
	l = merge_sort arr[0..m-1]
	r = merge_sort arr[m, arr.size-1]
	merge l, r 
end

def merge(left, right)
	l, r, m = 0, 0, 0
	res =  Array.new(left.size + right.size)

	while l <= left.size - 1 || r <= right.size - 1
		if l > left.size - 1
			res[m] = right[r]
			r += 1
		elsif r > right.size - 1
			res[m] = left[l]
			l += 1
		elsif left[l] <= right[r]
			res[m] = left[l]
			l += 1
		else
			res[m] = right[r]
			r += 1
		end

		m += 1
	end

	puts "#{left} <-> #{right} => #{res}"
	res
end

merge_sort([4,3,7,1,2,5,6])