module Enumerable
  # Your code goes here
  def my_each_with_index
    return self unless block_given?

    index = 0
    for element in self
      yield element, index
      index += 1
    end
    self
  end

  def my_select
    return self unless block_given?

    array = []
    for element in self
      array << element if yield element
    end
    array
  end

  def my_all?(&block)
    block = proc { |obj| obj } unless block_given?
    count = 0
    for element in self
      count += 1 if block.call(element)
    end
    count == self.size
  end

  def my_any?(&block)
    block = proc { |obj| obj } unless block_given?
    for element in self
      return true if block.call(element) == true
    end
    false
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    return self unless block_given?

    for element in self
      yield element
    end
    self
  end
end
