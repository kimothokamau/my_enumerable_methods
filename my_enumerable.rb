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

  def my_all?(arg = nil)
    if !block_given? && !arg
      to_a.my_each { |val| return false unless val }
    elsif arg.is_a?(Regexp)
      to_a.my_each { |val| return false unless arg.match(val) }
    else to_a.my_each { |val| return false unless yield(val) }
    end
    true
  end

  def my_any?(arg = nil)
    if !block_given? && !arg
      to_a.my_each { |val| return true if val }
    elsif arg.is_a?(Regexp)
      to_a.my_each { |val| return true if arg.match(val) }
    else to_a.my_each { |val| return true if yield(val) }
    end
    false
  end

  def my_none?(arg = nil)
    if !block_given? && !arg
      to_a.my_each { |val| return false if val }
    elsif arg.is_a?(Regexp)
      to_a.my_each { |val| return false if arg.match(val) }
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

  def my_map
    arr = []
    counter = 0
    until counter == length
      arr.push(yield(self[counter]))
      counter += 1
    end
    arr
  end
end

# Testing parameters
num_arr = [1, 2, 3, 2, 5]
words_arr = %w[ruby rails javascript react]
my_hash = { a: 1, b: 2, c: 3, d: 4 }

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

# puts '========Tests for my_all method========'

# puts 'Array - Return true if block condition is true for all vals'
# p(num_arr.my_all? { |num| num > 0 })

# puts 'Words-Array - Return true if block condition is true for all vals'
# p(words_arr.my_all? { |word| word.size > 3 })

# puts 'Hash - Return true if block condition is true for all vals'
# p(my_hash.my_all? { |_key, value| value > 0 })

# puts 'Range - Return true if block condition is true for all vals'
# p((1..10).my_all? { |val| val > 0 })

# puts 'REGEX - Return true if block condition is true for all words'
# p(words_arr.my_all?(/r/))

# puts '========Tests for my_any method========'

# puts 'Array - Return true if block condition is true for any val'
# p(num_arr.my_any? { |num| num > 2 })

# puts 'Words-Array - Return true if block condition is true for any val'
# p(words_arr.my_any? { |word| word.size > 5 })

# puts 'Hash - Return true if block condition is true for any val'
# p(my_hash.my_any? { |_key, value| value > 6 })

# puts 'Range - Return true if block condition is true for any val'
# p((1..10).my_any? { |val| val > 4 })

# puts 'REGEX - Return true if block condition is true for any word'
# p(words_arr.my_any?(/t/))

# puts '========Tests for my_none? method========'

# puts 'Array - Return true if block condition is not true for any val'
# p(num_arr.my_none? { |num| num > 2 })

# puts 'Words-Array - Return true if block condition is not true for any val'
# p(words_arr.my_none? { |word| word.size > 50 })

# puts 'Hash - Return true if block condition is not true for any val'
# p(my_hash.my_none? { |_key, value| value > 6 })

# puts 'Range - Return true if block condition is not true for any val'
# p((1..10).my_none? { |val| val > 4 })

# puts 'REGEX - Return true if block condition is not true for any word'
# p(words_arr.my_none?(/z/))

# puts '========Tests for my_count method========'

# puts 'Array - count the number of digits that satisfy condition'
# p(num_arr.my_count { |num| num > 1 })

# puts 'Array - count the number of digits that satisfy argument'
# p(num_arr.my_count(2))

# puts 'Array - count the number of digits in an array'
# p(num_arr.my_count)

# puts 'Range - count the number of even digits in a range'
# p((1..10).my_count { |val| val.even? })

# puts 'Hash - count the number of values in a hash'
# p(my_hash.my_count)

# puts '========Tests for my_map method========'

p(num_arr.my_map { |n| n * 4 })

# puts '========Tests for my_inject method========'

# p(num_arr.my_inject(0) { |y, item| y + item })
