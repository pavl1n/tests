# frozen_string_literal: true

require_relative 'swapping'

# Finding time intersection
class Example
  def initialize(arr)
    @res = []
    @temp = []
    @arr = arr
  end

  def not_string
    @arr.flatten.each do |element|
      raise ArgumentError if element !~ (/^((1*[0-9])|(2[0-3])):[0-5][0-9]$/)
    end
  end

  def convert
    not_string
    @arr.each_with_index do |time, index_outer|
      range = (time.first...time.last)
      check(range, time, index_outer)
    end
    @res
  end

  def check(range, time, index_outer)
    @arr.each_with_index do |num, index_inner|
      next unless index_outer < index_inner && num != time

      range.include?(num.first) || range.include?(num.last) ? @temp << time && @temp << num : next
      save
    end
  end

  def save
    @res << Swap.swapping(@temp)
    @temp = []
  end
end
