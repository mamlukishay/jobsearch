
=begin 

Given a max-heap represented as an array, return the kth largest element without modifying the heap. I was asked to do it in linear time, but was told it can be done in log time.

=end

def kth_largest(heap, k)
	rank = (Math.log2(k)).floor 																			# O(1)
	first_in_rank = (2 ** rank) - 1 																	# O(1)
	last_in_rank = (2 ** (rank + 1)) - 1 															# O(1)
	sorted_subheap = heap[first_in_rank..last_in_rank].sort {|x| x} 	# O(nlogn)
	index_in_subheap = k - first_in_rank - 1 													# O(1)
	sorted_subheap[index_in_subheap] 																	# O(1)
end


k = 3
heap = [10,8,9,4,3,6,7]
p kth_largest heap, k





