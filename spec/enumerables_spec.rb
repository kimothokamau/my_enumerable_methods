require_relative '../my_enumerable'

describe Enumerable do
  let(:num_arr) { [1, 2, 3, 4, 5] }
  let(:words_arr) { %w[ruby rails javascript react] }
  let(:my_hash) { { a: 1, b: 2, c: 3, d: 4 } }
  let(:my_range) { [1..10]}

  describe '#my_each' do
    it 'compares the output of my_each vs each enumerable methods on a number array with a block' do
      expect(num_arr.my_each { |e| puts "#{e}" }).to eql(num_arr.each { |e| puts "#{e}" })
    end

    it 'compares the output of my_each vs each enumerable methods on a word array' do
      expect(words_arr.my_each { |e| puts "#{e}" }).to eql(words_arr.each { |e| puts "#{e}" })
    end

    it 'compares the output of my_each vs each enumerable methods on a hash' do
      expect(my_hash.my_each { |key, _value| puts "#{key}" }).to eql(my_hash.each { |key, _value| puts "#{key}" })
    end
  end

  describe '#my_each_with_index' do
    it 'compares the output of my_each_with_index vs each_with_index enumerable methods on a number array with a block' do
      expect(num_arr.my_each_with_index { |value, index| puts "#{index}" }).to eql(num_arr.each_with_index { |value, index| puts "#{index}" })
    end

    it 'compares the output of my_each_with_index vs each_with_index enumerable methods on a word array' do
      expect(words_arr.my_each_with_index { |value, index| puts "#{index}" }).to eql(words_arr.each_with_index { |value, index| puts "#{index}" })
    end

    it 'compares the output of my_each_with_index vs each_with_index enumerable methods on a hash' do
      expect(my_hash.my_each_with_index { |key, _value| puts "#{key}" }).to eql(my_hash.each_with_index { |key, _value| puts "#{key}" })
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
end