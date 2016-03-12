require 'byebug'

def brute_force(arr, target)
  idx1 = 0

  while idx1 < arr.length
    idx2 = 1
    while idx1 + idx2 < arr.length
      return true if arr[idx1] + arr[idx1 + idx2] == target
      idx2 += 1
    end
    idx1 += 1
  end

  false
end

def sorting(arr, target)

  arr.each do |value|
    if value == 0
      diff = target
    elsif target / value == 2
      next
    else
      diff = target - value
    end

    found = arr.bsearch { |next_value| next_value == diff }

    if !found.nil? #&& value + found == target
      return true
    end
  end

  false
end

def nusorting(arr, target) #no_uniqs
  return true if arr.include?(target/2) && arr.count(target/2) >= 2
  # count = 0

  arr.each do |value|
    diff = target - value
    found = arr.bsearch { |next_value| next_value == diff }

    if !found.nil? #&& value + found == target
      return true
    end
  end

  false
end

def hash_map(arr, target)
  values = Hash.new

  arr.each do |value|
    values[value] = target - value unless value == 0 || target / value == 2
  end

  values.any? {|key, value| key == values[value] && value == values.key(key) }

end

def nuhash_map(arr, target) #no_uniqs
  values = Hash.new(0)

  arr.each { |value| values[value] += 1 }

  arr.each do |value|
    diff = target - value
    if diff == value
      return values[value] > 1
    elsif values.has_key?(diff)
      return values[diff] >= 1
    end
  end

end
