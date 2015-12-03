

def sum_opts(n)
  sum_opts_helper(n)
end

def sum_opts_helper(n)
  return [] if n == 0

  p n
  p "------"
  res = nil

  (1..n).each do |x|
    res = [x] + opt
    sum_opts_helper(n-x).each do |opt|

  res
    end
  end

  res
end


p sum_opts(4) # expect [[1,1,1,1], [1,1,2], [2,2], [3,1]]