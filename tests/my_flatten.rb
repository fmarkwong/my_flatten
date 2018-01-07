require 'minitest/autorun'
require_relative '../my_flatten'

class MyFlattenTest < Minitest::Test
  TEST_CASES = {
      [1] => [1],
      [[[1]]] => [1],
      [1, 2, 3, 4] => [1, 2, 3, 4],
      [[1, 2, [3]], 4] => [1, 2, 3, 4],
      [1, 2, [3, 4, 5, [6, 7], [8]]] => [1, 2, 3, 4, 5, 6, 7, 8]
  }

  describe "my_flatten" do
    it "returns flattened array" do
      TEST_CASES.each do |input, output|
        assert input.my_flatten === output
      end 
    end
  end

  describe "my_flatten!" do
    it "flattens array in place" do
      TEST_CASES.each do |input, output|
        input.my_flatten!
        assert input === output
      end 
    end
  end

  describe "non-integer elements" do
    it "raises exception" do
      error = assert_raises StandardError do 
        [1, 2, 'A', 5].my_flatten 
      end
      assert_match /must be integers/, error.message
    end
  end
end
