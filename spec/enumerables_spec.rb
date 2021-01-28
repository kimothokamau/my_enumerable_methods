# rubocop: disable Layout/LineLength

require_relative '../my_enumerable'

describe Enumerable do
  let(:num_arr) { [1, 2, 3, 4, 5] }
  let(:words_arr) { %w[ruby rails javascript react] }
  let(:my_hash) { { a: 1, b: 2, c: 3, d: 4 } }
  let(:my_range) { [1..10] }

  describe '#my_each' do
    it 'compares the output of my_each vs each enumerable methods on a number array with a block' do
      expect(num_arr.my_each { |e| puts e.to_s }).to eql(num_arr.each { |e| puts e.to_s })
    end

    it 'compares the output of my_each vs each enumerable methods on a word array' do
      expect(words_arr.my_each { |e| puts e.to_s }).to eql(words_arr.each { |e| puts e.to_s })
    end

    it 'compares the output of my_each vs each enumerable methods on a hash' do
      expect(my_hash.my_each { |key, _value| puts key.to_s }).to eql(my_hash.each { |key, _value| puts key.to_s })
    end
  end

  describe '#my_each_with_index' do
    it 'compares the output of my_each_with_index vs each_with_index enumerable methods on a number array with a block' do
      expect(num_arr.my_each_with_index { |_value, index| puts index.to_s }).to eql(num_arr.each_with_index { |_value, index| puts index.to_s })
    end

    it 'compares the output of my_each_with_index vs each_with_index enumerable methods on a word array' do
      expect(words_arr.my_each_with_index { |_value, index| puts index.to_s }).to eql(words_arr.each_with_index { |_value, index| puts index.to_s })
    end

    it 'compares the output of my_each_with_index vs each_with_index enumerable methods on a hash' do
      expect(my_hash.my_each_with_index { |key, _value| puts key.to_s }).to eql(my_hash.each_with_index { |key, _value| puts key.to_s })
    end
  end

  describe '#my_select' do
    it 'compares the output of my_select vs select enumerable methods on a number array with a block' do
      expect(p(num_arr.my_select { |e| e > 2 })).to eql(p(num_arr.select { |e| e > 2 }))
    end

    it 'compares the output of my_select vs select enumerable methods on a word array' do
      expect(p(words_arr.my_select { |word| word.length > 4 })).to eql(p(words_arr.select { |word| word.length > 4 }))
    end

    it 'compares the output of my_select vs select enumerable methods on a hash' do
      expect(p(my_hash.my_select { |_key, value| value > 2 })).to eql(p(my_hash.select { |_key, value| value > 2 }))
    end
  end

  describe '#my_all?' do
    it 'compares the output of my_all vs all enumerable methods on a number array with a block' do
      expect(p(num_arr.my_all? { |e| e > 2 })).to eql(p(num_arr.all? { |e| e > 2 }))
    end

    it 'compares the output of my_all vs all enumerable methods on a word array' do
      expect(p(words_arr.my_all? { |word| word.length > 2 })).to eql(p(words_arr.all? { |word| word.length > 2 }))
    end

    it 'compares the output of my_all vs all enumerable methods on a hash' do
      expect(p(my_hash.my_all? { |_key, value| value > 2 })).to eql(p(my_hash.all? { |_key, value| value > 2 }))
    end

    it 'compares the output of my_all vs all enumerable methods on a word array with a regex block condition' do
      expect(p(words_arr.my_all?(/z/))).to eql(p(words_arr.all?(/z/)))
    end

    it 'compares the output of my_all vs all enumerable methods on a number array if all numbers in the array are a member of the class in the argument' do
      expect(p(num_arr.my_all?(Numeric))).to eql(p(num_arr.all?(Numeric)))
    end

    it 'compares the output of my_all vs all enumerable methods on a number array if all numbers in the array are a member of the class in the argument' do
      expect(p(num_arr.my_all?(2))).to eql(p(num_arr.all?(2)))
    end
  end

  describe '#my_any?' do
    it 'compares the output of my_any vs any enumerable methods on a number array with a block' do
      expect(p(num_arr.my_any? { |num| num > 2 })).to eql(p(num_arr.any? { |num| num > 2 }))
    end

    it 'compares the output of my_any vs any enumerable methods on a word array' do
      expect(p(words_arr.my_any? { |word| word.size > 5 })).to eql(p(words_arr.any? { |word| word.length > 5 }))
    end

    it 'compares the output of my_any vs any enumerable methods on a hash' do
      expect(p(my_hash.my_any? { |_key, value| value > 6 })).to eql(p(my_hash.any? { |_key, value| value > 6 }))
    end

    it 'compares the output of my_any vs any enumerable methods on a word array with a regex block condition' do
      expect(p(words_arr.my_any?(/t/))).to eql(p(words_arr.any?(/t/)))
    end

    it 'compares the output of my_any vs any enumerable methods on a number array if any of the numbers in the array are a member of the class in the argument' do
      expect(p(num_arr.my_any?(Numeric))).to eql(p(num_arr.any?(Numeric)))
    end

    it 'compares the output of my_any vs any enumerable methods on a word array if any word in the array match the argument' do
      expect(p(words_arr.my_any?('react'))).to eql(p(words_arr.any?('react')))
    end
  end

  describe '#my_none?' do
    it 'compares the output of my_none vs the none enumerable method on a number array with a block' do
      expect(p(num_arr.my_none? { |num| num > 2 })).to eql(p(num_arr.none? { |num| num > 2 }))
    end

    it 'compares the output of my_none vs the none enumerable method on a hash' do
      expect(p(my_hash.my_none? { |_key, value| value > 6 })).to eql(p(my_hash.none? { |_key, value| value > 6 }))
    end

    it 'compares the output of my_none vs the none enumerable method on a word array with a regex block condition' do
      expect(p(words_arr.my_none?(/z/))).to eql(p(words_arr.none?(/z/)))
    end

    it 'compares the output of my_none vs the none enumerable method on a word array if any of the words in the array are a member of the class in the argument' do
      expect(p(words_arr.my_none?(Integer))).to eql(p(words_arr.none?(Integer)))
    end

    it 'compares the output of my_none vs the none enumerable method on a word array if any word in the array match the argument' do
      expect(p(words_arr.my_none?('react'))).to eql(p(words_arr.none?('react')))
    end
  end

  describe '#my_count?' do
    it 'compares the output of my_count vs the count enumerable method on a number array with a block' do
      expect(p(num_arr.my_count { |num| num > 1 })).to eql(p(num_arr.count { |num| num > 1 }))
    end

    it 'compares the output of my_count vs the count enumerable method on a hash' do
      expect(p(my_hash.my_count)).to eql(p(my_hash.count))
    end

    it 'compares the output of my_count vs the count enumerable method on a number array that counts the elements in the array' do
      expect(p(num_arr.my_count)).to eql(p(num_arr.count))
    end

    it 'compares the output of my_count vs the count enumerable method on a number array if any number in the array match the argument' do
      expect(p(num_arr.my_count(2))).to eql(p(num_arr.count(2)))
    end
  end

  describe '#my_map' do
    it 'compares the output of my_map vs the map enumerable method on a number array with a block' do
      expect(p(num_arr.my_map { |n| n * 4 })).to eql(p(num_arr.map { |n| n * 4 }))
    end

    it 'compares the output of my_map vs the map enumerable method on a hash' do
      expect(p(my_hash.my_map { |_key, val| val + 1 })).to eql(p(my_hash.map { |_key, val| val + 1 }))
    end

    it 'compares the output of my_map vs the map enumerable method on a word array that capitalizes the elements in the array' do
      expect(p(words_arr.my_map(&:upcase))).to eql(p(words_arr.map(&:upcase)))
    end
  end

  describe '#my_inject' do
    it 'compares the output of my_inject vs the inject enumerable method on a number array with a block' do
      expect(p(num_arr.my_inject { |value| value * 2 })).to eql(p(num_arr.inject { |value| value * 2 }))
    end

    it 'compares the output of my_inject vs the inject enumerable method on a hash' do
      expect(p(my_hash.my_inject { |_key, val| val })).to eql(p(my_hash.inject { |_key, val| val }))
    end
  end
end

# rubocop: enable Layout/LineLength
