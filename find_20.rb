require 'pry'

def find_20(arr)
   twenies = []
   combs = build_combs(arr)

   combs.each do |pair1, val1|
      combs.each do |pair2, val2|
         next if pair1.include?(pair2[0]) || pair1.include?(pair2[1])
         twenies += [(pair1+pair2).flatten] if val1 + val2 == 20
      end
   end

   twenies
end


def build_combs(arr)
   combs = {}

   arr.each_with_index do |val1, i|
      arr.each_with_index do |val2, j|
         next if i == j
         combs[[i,j]] = val1 + val2 unless combs[[j,i]]
      end
   end

   combs
end


find_20([3,5,2,10,1,7,4]).each { |e| p e  }