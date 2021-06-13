# frozen_string_literal: true

# Swapping elements in array
class Swap
  def self.swapping(arr)
    p arr
    arr = arr.flatten.sort.uniq
    if arr.size == 3
      arr << arr[1]
      arr.sort!
    end
    arr.each_slice(2).to_a
  end
end
