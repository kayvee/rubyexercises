require 'byebug'

def range(start, final)
  return [] if final < start
  numbers_between = [start]
  numbers_between + range(start + 1, final)
end

# def sum_iterative(array)
#   total = 0
#   array.each {|el| total += el}
#   total
# end

#more efficient way of doing iterative: .inject over .each do {}
def sum_iterative(array)
  array.inject{|a, el| a += el}
end

def sum_recursive(array)
  copied_array = array.dup
  return 0 if copied_array.empty?
  current_recursion = copied_array.pop
  # return array[0] if array.count == 1 # unnecessary line because of other base case
  current_recursion + sum_recursive(copied_array)
end

def exponent_recur1(num, exp)
  return 1 if exp == 0
  num * exponent_recur1(num, exp-1)
end

def exponent_recur2(num, exp)
  return 1 if exp == 0
  return num if exp == 1
  if exp % 2 == 0
    exponent_recur2(num, exp / 2) * exponent_recur2(num, exp / 2)
  else
    exponent_recur2(num, (((exp-1) /2 ) * num )) * num
  end
end

def deep_dup(old_array)
  new_array = []
  old_array.each do |el|
    if el.is_a?(Array) && el.include?(Array)
      deep_dup(el)
    else
      new_array << el
    end
  end

  new_array
  # flat_array = []
  # el.each do |el2|
  #   if el2.is_a?(Array)
  #     deep_dup(el2)
  #   else
  #     flat_array << el2
  #   end
  #
end

def fibonacci_iterative(num)
  return [] if num.zero?
  return [0] if num == 1
  return [0, 1] if num == 2

  array_of_fib_nums = [0,1]
  (num - 2).times do
    array_of_fib_nums << array_of_fib_nums[-1] + array_of_fib_nums[-2]
  end

  array_of_fib_nums
end

def fibonacci_recursive(num)
  array_of_fib_nums = []

  if num.zero?
    return []
  elsif num == 1
    return [0]
  elsif num == 2
    return [0,1]
  else
    array_of_fib_nums += fibonacci_recursive(num-1)
    array_of_fib_nums += [(array_of_fib_nums[-1] + array_of_fib_nums[-2])]
  end

  array_of_fib_nums

end

def bsearch(array, target)
  return nil if array.empty?

  position = array.length / 2

  if array[position] > target
    bsearch(array[0...position], target)
  elsif array[position] < target
    current_bsearch = bsearch(array[position+1..-1], target) #saved here so it isn't running this twice
    if current_bsearch.nil?
      nil
    else
      position + 1 + current_bsearch #include position + 1 because this is the second half, trying to keep track of the position to add to the new position which will be shifted
    end
  elsif array[position] == target
    position
  end

end

def merge_sort(input_array)
  copied_array = input_array.dup
  return [] if copied_array.empty?
  return copied_array if copied_array.count == 1
  final_array = []
  position = copied_array.length / 2
  first_half = merge_sort(copied_array[0...position])
  second_half = merge_sort(copied_array[position..-1])

  merge(first_half, second_half)
end

def merge(array1, array2) #helper method for merge_sort (to merge sorted halves)

  inner_merged_values = []

  until array1.length == 0 || array2.length == 0
    if array1[0] < array2[0]
      inner_merged_values << array1.shift
    else
      inner_merged_values << array2.shift
    end
  end

  inner_merged_values + array1 + array2

end
