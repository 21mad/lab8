class TaskController < ApplicationController
  def input
  end

  def show
    str = params[:array]
    arr = str.split(' ').map { |el| el.to_i }
    @segments = get_segments(arr)
    @max_seg = (@segments.max_by { |elem| elem[:length] })[:segment]
    @count = @segments.length
  end

  def is_perfect?(num)
    summ = 0
    ans = false
    (1...num).each do |i|
      summ += i if (num % i).zero?
    end
    ans = true if (summ == num) && num.positive?
    ans
  end

  def get_segments(array)
    result = []
    len = 0
    seg = []
    array.each do |elem|
      if is_perfect?(elem)
        len += 1
        seg.append(elem)
      else
        result.append({ length: len, segment: seg.join(' ') }) if len.positive?
        len = 0
        seg = []
      end
    end
    result.append({ length: len, segment: seg.join(' ') }) if len.positive?
    result
  end
end
