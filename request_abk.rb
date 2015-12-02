def request(arr, a, b, k)
	(arr.slice(a..b).sort)[k]
end

arr = [3,4,5,0,1,2]
puts request arr, 2, 4, 2