  ##
  # Add methods to Array class to flatten nested array of integers
  #
  # To run tests:
  #
  #  bundle install to install minitest
  #  ruby tests/my_flatten.rb -v
  #
class Array

  ##
  # Flattens an array of arbitrarily nested arrays of integers
  #
  def my_flatten
    retVal = [];
    self.each do |e| 
      if e.instance_of? Array
        retVal.push(*e.my_flatten)
      else
        raise StandardError.new("All array elements must be integers") unless e.instance_of? Integer
        retVal.push e
      end
    end
    retVal
  end

  ##
  # Flattens an array of arbitrarily nested arrays in place
  #
  def my_flatten!
    self.replace(my_flatten)
  end
end
