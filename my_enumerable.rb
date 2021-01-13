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

  def my_inject(result)
    my_each do |item|
      result = yield(result, item)
    end
    result
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

  # def my_all?(arg = nil)
  #   if !block_given? && !arg
  #     to_a.my_each { |val| return false unless val }
  #   elsif arg.is_a?(Class)
  #     to_a.my_each { |val| return false unless val.is_a?(arg)}
  #   elsif

  #   my_each do |item|
  #     return false unless yield(item)
  #   end
  #   true
  # end

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

# Testing parameters
num_arr = [1, 2, 3, 4, 5]
# words_arr = %w[HTML CSS Ruby Rails Javascript React]
# my_hash = { a: 1, b: 2, c: 3, d: 4 }

# puts '========Tests for my_each method========'

# puts 'Numerical array'
# num_arr.my_each { |e| puts "The block just got handed #{e} " }

# puts 'Word array'
# words_arr.my_each { |e| puts "At microverse we learn #{e} " }

# puts 'Hash'
# my_hash.my_each { |value| p value }
# p(my_hash.my_each { |value| p value })

# puts 'Range'
# (1..10).my_each { |value| p value }
# p((1..10).my_each { |value| p value })

# puts '========Tests for my_each_with_index method======='

# puts 'Numerical array'
# num_arr.my_each_with_index { |value, index| puts "#{value} is at index #{index}" }

# puts 'Word Array'
# words_arr.my_each_with_index { |value, index| puts "#{value} is the #{index} language we learn" }

# puts 'Hash'
# my_hash.my_each_with_index { |value, index| p "#{value} is at index #{index}" }

# puts 'Range'
# (1..10).my_each_with_index { |value, index| p "#{value} is at index #{index}" }

# puts '========Tests for my_select method========'

# puts 'Numerical Array -Return numbers greater than 1'
# p(num_arr.my_select { |num| num > 1 })

# puts 'Hash - Return hash where value is greater than 1'
# p(my_hash.my_select { |_key, value| value > 1 })

# puts 'Range - Return even numbers in range'
# p((1..10).my_select { |val| val.even? })

# p(num_arr.my_all? { |num| num > 2 })

# p(num_arr.my_any? { |num| num > 5 })

# p(num_arr.my_none { |num| num > 7 })

# p(num_arr.my_count { |num| num > 1 })

# p(num_arr.my_map { |n| n * 4 })

# puts '========Tests for my_inject method========'

p(num_arr.my_inject(0) { |y, item| y + item })
