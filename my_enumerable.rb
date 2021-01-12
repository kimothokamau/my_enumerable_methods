module Enumerable
  def my_each
    counter = 0
    until counter == length
      yield(self[counter])
      counter += 1
    end
    self
  end

  def my_each_with_index
    counter = 0
    until counter == length
      yield(self[counter], counter)
      counter += 1
    end
    self
  end

  def my_select
    arr = []
    my_each do |val|
      arr.push(val) if yield(val)
    end
    arr
  end

  def my_all?
    my_each do |item|
      return false unless yield(item)
    end
    true
  end

  def my_any?
    my_each do |item|
      return true if yield(item)
    end
    false
  end

  def my_none
    my_each do |item|
      return false if yield(item)
    end
    true
  end

  def my_count
    counter = 0
    my_each do |item|
      counter += 1 if yield(item)
    end
    counter
  end

  def my_map
    arr = []
    counter = 0
    until counter == length
      arr.push(yield(self[counter]))
      counter += 1
    end
    arr
  end

  def my_inject
    
  end

end

array = [1, 2, 3, 4, 5]
# array.my_each { |e| puts "The block just got handed #{e} " }

# array1 = %w[kevin sylvia lucy grace]
# array1.my_each_with_index { |child, index| puts "#{child} the #{index + 1} born" }
# p(array.my_select { | num | num.even? })

# p(array.my_all? { |num| num > 0 })

# p(array.my_any? { |num| num > 5 })

#p(array.my_none { |num| num > 7 })

#p(array.my_count { |num| num > 1 })

p(array.my_map { |n| n * 4 })