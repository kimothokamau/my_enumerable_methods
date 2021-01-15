# rubocop: disable Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity, Metrics/ModuleLength

module Enumerable
  def my_each
    return to_enum(:my_each) unless block_given?

    counter = 0
    until counter == size
      yield to_a[counter]
      counter += 1
    end
    self
  end

  def my_each_with_index
    return to_enum(:my_each) unless block_given?

    counter = 0
    until counter == size
      yield to_a[counter], counter
      counter += 1
    end
    self
  end

  def my_select
    return to_enum(:my_each) unless block_given?

    new_arr = []
    new_hash = {}
    if is_a?(Hash)
      my_each do |key, val|
        new_hash[key] = val if yield(key, val)
      end
      new_hash
    else
      my_each do |val|
        new_arr.push(val) if yield(val)
      end
      new_arr
    end
  end

  def my_all?(arg = nil)
    if !block_given? && !arg
      to_a.my_each { |val| return false unless val }
    elsif arg.is_a?(Class)
      to_a.my_each { |val| return false unless val.is_a?(arg) }
    elsif arg.is_a?(Regexp)
      to_a.my_each { |val| return false unless arg.match(val) }
    elsif arg
      to_a.my_each { |val| return false unless val == arg }
    else to_a.my_each { |val| return false unless yield(val) }
    end
    true
  end

  def my_any?(arg = nil)
    if !block_given? && !arg
      to_a.my_each { |val| return true if val }
    elsif arg.is_a?(Regexp)
      to_a.my_each { |val| return true if arg.match(val) }
    elsif arg.is_a?(Class)
      to_a.my_each { |val| return true if val.is_a?(arg) }
    elsif arg
      to_a.my_each { |val| return true if val == arg }
    else to_a.my_each { |val| return true if yield(val) }
    end
    false
  end

  def my_none?(arg = nil)
    if !block_given? && !arg
      to_a.my_each { |val| return false if val }
    elsif arg.is_a?(Regexp)
      to_a.my_each { |val| return false if arg.match(val) }
    elsif arg.is_a?(Class)
      to_a.my_each { |val| return false if val.is_a?(arg) }
    elsif arg
      to_a.my_each { |val| return false if val == arg }
    else to_a.my_each { |val| return false if yield(val) }
    end
    true
  end

  def my_count(para = nil)
    counter = 0
    if block_given?
      to_a.my_each { |val| counter += 1 if yield(val) }
    elsif para
      to_a.my_each { |val| counter += 1 if para == val }
    else counter = to_a.length
    end
    counter
  end

  def my_map(my_proc = nil)
    return to_enum(:my_map) unless block_given?

    arr = []
    if block_given? && my_proc.is_a?(Proc)
      my_each do |index|
        arr.push(my_proc.call(index))
      end
    elsif !block_given? && my_proc.is_a?(Proc)
      my_each do |index|
        arr.push(my_proc.call(index))
      end
    else
      my_each do |index|
        arr.push(yield(index))
      end
    end
    arr
  end

  def my_inject(*arg)
    raise LocalJumpError unless block_given? || !arg.empty?

    arg = arg.pop unless block_given?
    my_array = arg + to_a
    memo = my_array.shift
    if block_given?
      my_array.my_each { |item| memo = yield(memo, item) }
    else
      my_array.my_each { |item| memo = memo.send(arg, item) }
    end
    memo
  end
end
# rubocop: enable Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity/Metrics/ModuleLength

def multiply_els(arr)
  arr.my_inject { |num, elem| num * elem }
end
