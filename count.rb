#O(n^2)
def my_min1(ary)

  ary.each_with_index do |el, ind|
    flag = true
    ary.each_with_index do |el2, ind2|
      if el2 < el
        flag = false
      elsif ind == ind2
        next
      end
    end
    return el if flag == true
  end

end

#O(n)
def my_min2(ary)

  smallest = ary[0]

  ary.each do |el|
    smallest = el if el < smallest
  end

  smallest

end

#O(n^2)
def largest_cont_subsum1(ary)

  subarrays = []

  (ary.length - 1).times do |idx1|
    idx2 = 0
    while idx1 + idx2 < ary.length
      subarrays << ary[idx1..(idx1 + idx2)]
      idx2 += 1
    end
  end

  subarrays.map { |subarray| subarray.inject(:+) }.max

end

#O(n)
def largest_cont_subsum2(ary)
  best_sum = ary[0]
  current_sum = 0

  ary.each do |num|
    current_sum += nums
    best_sum = current_sum if current_sum > best_sum
    current_sum = 0 if current_sum < 0
  end
  best_sum
end
