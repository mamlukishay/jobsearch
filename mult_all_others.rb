
#  in  [2,3,1,4]
#  out [12,8,24,6]

def mult_others(arr)
  retval = []

  arr.each_with_index do |item1, i|
    res = 1

    arr.each_with_index do |item2, j|
      next if i == j
      res *= item2
    end

    retval << res
  end

  retval
end


p mult_others [2,3,4]