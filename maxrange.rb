def n_max(arr, w)

  current_max_range = nil

  arr.length.times do |ind|
    break if ind + w > arr.length
    max = arr[ind...(ind+w)].max
    min = arr[ind...(ind+w)].min
    range = max - min
    current_max_range = range if current_max_range.nil? || range > current_max_range
  end

  current_max_range

end

def o_max(arr, w)
  queue = arr[0...w]
  new_queue = []
  current_max_range = nil

  min = nil
  max = nil

  idx = 0
  while idx + w < arr.length
    goodbye_num = queue.shift
    new_queue << goodbye_num
    hello_num = arr[idx + w]



    queue << hello_num
    idx += 1
  end
  current_max_range

end

[1,2,3,4], 2
1,2[3,4]
