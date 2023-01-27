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
