@i = 0

def quick_sort(arr, b, e)
	return if b >= e

	r = rand b..e
	arr[b], arr[r] = arr[r], arr[b]

	part = partition(arr, b, e)
	quick_sort(arr, b, part)
	quick_sort(arr, part+1, arr.size-1)
end

def partition(arr, b, e)
	pivot = arr[b]
	left_wall = b

	((b+1)..e).each do |i|
		if arr[i] < pivot
			left_wall += 1
			arr[left_wall], arr[i] = arr[i], arr[left_wall]
		end
	end

	arr[b], arr[left_wall] = arr[left_wall], arr[b]
	return left_wall		
end

arr = [4,3,7,1,2,5,6, 11, 1, 3]
quick_sort(arr, 0, 6)
puts arr.inspect