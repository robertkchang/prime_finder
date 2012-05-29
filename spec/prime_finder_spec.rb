require "spec_helper"
require 'prime_finder'

describe "Test" do
  it "should find prime_finder with the upper bound given" do
    upper_bound = 10
    return_arr = Array[2,3,5,7,9]
    finder = PrimeFinder.new
    finder.should_receive(:find_prime).with(upper_bound).and_return(return_arr)
    finder.find_prime(upper_bound)
  end

  it "should return an array of prime_finder numbers from find_prime" do
    upper_bound = 10
    return_arr = Array[2,3,5,7,9]
    finder = PrimeFinder.new
    finder.stub(:find_prime => return_arr)
    finder.find_prime(upper_bound).should eql return_arr
  end

  it "should return an array as the result from find_prime" do
    upper_bound = 10
    finder = PrimeFinder.new
    finder.find_prime(upper_bound).class.should eql Array
  end

  it "should return an array with the correct prime_finder numbers from find_prime" do
    upper_bound = 10
    finder = PrimeFinder.new
    return_arr = finder.find_prime(upper_bound)
    return_arr.size.should eql 4
    return_arr[0].should eql 2
    return_arr[1].should eql 3
    return_arr[2].should eql 5
    return_arr[3].should eql 7
  end

  it "should return an empty array if upper bound 0 is passed into find_prime" do
    upper_bound = 0
    finder = PrimeFinder.new
    return_arr = finder.find_prime(upper_bound)
    return_arr.size.should eql 0
  end

end