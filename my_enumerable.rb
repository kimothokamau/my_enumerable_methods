module Enumerable
  def my_each
    counter = 0
    until counter == length
      yield self[counter]
      counter += 1
    end
    self
  end
end

array = [1, 2, 3, 4, 5]
array.my_each { |e| puts "The block just got handed #{e} " }
