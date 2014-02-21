require 'minitest/autorun'
require 'minitest/spec'

module Quiz
  def self.continuous_subsequence(arr, largest = 0)
    turns = arr.size - 1

    turns.times do |n|
      sum = arr[n] + arr[n+1]
      largest = sum if largest < sum
    end
    
    largest
  end

  def self.split_with_delimiter(input_string, delimiter = ' ')
    input_string.split(delimiter)
  end

  def self.bubble_sort(arr)
    turns = arr.size - 1

    loop do
      is_swapped = false

      turns.times do |n|
        if arr[n] > arr[n+1]
          arr[n], arr[n+1] = arr[n+1], arr[n]
          is_swapped = true
        end
      end
      
      break unless is_swapped
    end

    arr
  end
end


describe Quiz do
  it 'continuous_subsequence() should find lagest sum' do
    arr = [1, 3, 4, 7, 3, 8, 9]
    Quiz::continuous_subsequence(arr).must_equal 17
  end

  it 'split_with_delimiter() should split string with certian delimiter' do
    input_string = "Hello, Mr. Black"
    Quiz::split_with_delimiter(input_string).must_equal ['Hello,', 'Mr.', 'Black']
    Quiz::split_with_delimiter(input_string, '.').must_equal ['Hello, Mr', ' Black']
    Quiz::split_with_delimiter(input_string, ',').must_equal ['Hello', ' Mr. Black']
  end

  it 'bubble_sort() should sort array correctly' do
    arr = [6, 2, 5, 1, 0, 3, 3, 9]
    sorted_arr = [0, 1, 2, 3, 3, 5, 6, 9]

    Quiz::bubble_sort(arr).must_equal sorted_arr 
  end
end
