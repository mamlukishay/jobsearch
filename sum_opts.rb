=begin

Given a number N, write a program that returns all possible combinations of numbers that add up to N, as lists. (Exclude the N+0=N) 
For example, if N=4 return {{1,1,1,1},{1,1,2},{2,2},{1,3}}

=end

require 'benchmark'

def sum_opts(n)
  res = nil
  time = Benchmark.realtime do
    res = sum_opts_helper(n)
    res[0..(res.size - 2)]
  end

  puts "TIME: #{time.round(5)}"
  res
end

def sum_opts2(n)
  res = nil
  time = Benchmark.realtime do
    res = sum_opts_dp(n)
    res[0..(res.size - 2)]
  end

  puts "TIME: #{time.round(5)}"
  res
end

def sum_opts_helper(n, indent = 0)
  return [[]] if n == 0

  res = []

  (1..n).each do |x|
    sum_opts_helper(n-x, indent+4).each do |next_res|
      res << [x] + next_res
    end
  end

  res
end

def sum_opts_dp(n, indent = 0, f = {})
  return [[]] if n == 0

  res = []

  (1..n).each do |x|
    sum_opts_helper(n-x, indent+4).each do |next_res|
      res << [x] + next_res
      f[n] ||= res
    end
  end

  res
end


p sum_opts(4) # expect [[1,1,1,1], [1,1,2], [2,2], [3,1]]
puts '-------------------'
p sum_opts2(4) # expect [[1,1,1,1], [1,1,2], [2,2], [3,1]]