module Enumerable
  # Your code goes here
  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    index = 0
    for element in self
      yield element, index
      index += 1
    end
    self
  end

  def my_select
    return to_enum(:my_select) unless block_given?

    array = []
    for element in self
      array << element if yield element
    end
    array
  end

  def my_all?(&block)
    block = proc { |obj| obj } unless block_given?
    for element in self
      return false unless block.call(element)
    end
    true
  end

  def my_any?(&block)
    block = proc { |obj| obj } unless block_given?
    for element in self
      return true if block.call(element)
    end
    false
  end

  def my_none?(&block)
    block = proc { |obj| obj } unless block_given?
    for element in self
      return false if block.call(element)
    end
    true
  end

  def my_count(&block)
    block = proc { |obj| obj } unless block_given?
    count = 0
    for element in self
      count += 1 if block.call(element)
    end
    count
  end

  def my_map
    return to_enum(:my_map) unless block_given?

    array = []
    for element in self
      array << yield(element)
    end
    array
  end

  def my_inject(initial = nil)
    memo = initial.nil? ? first : initial
    for element in self
      memo = yield(memo, element)
    end
    memo
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    return to_enum(:my_each) unless block_given?

    for element in self
      yield element
    end
    self
  end
end
