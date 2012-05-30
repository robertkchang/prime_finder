require "spec_helper"
require 'prime_finder'

describe "Test" do
  it "should call prime_finder with the lower and upper bound given" do
    lower_bound = 2
    upper_bound = 10
    return_arr = Array[2,3,5,7,9]
    finder = PrimeFinder.new
    finder.should_receive(:find_primes).with(lower_bound, upper_bound).and_return(return_arr)
    finder.find_primes lower_bound, upper_bound
  end

  it "should call prime_finder with the upper bound given" do
    upper_bound = 10
    return_arr = Array[2,3,5,7,9]
    finder = PrimeFinder.new
    finder.should_receive(:find_primes).with(upper_bound).and_return(return_arr)
    finder.find_primes upper_bound
  end

  it "should given lower bound of 2 and upper bound of 10 return an array of prime numbers" do
    lower_bound = 2
    upper_bound = 10
    return_arr = Array[2,3,5,7,9]
    finder = PrimeFinder.new
    finder.stub(:find_primes => return_arr)
    this_arr = finder.find_primes lower_bound, upper_bound
    this_arr.should eql return_arr
  end

  it "should given only upper bound of 10 return an array of prime numbers" do
    upper_bound = 10
    return_arr = Array[2,3,5,7,9]
    finder = PrimeFinder.new
    finder.stub(:find_primes => return_arr)
    this_arr = finder.find_primes upper_bound
    this_arr.should eql return_arr
  end

  it "should return an array as the result from find_primes" do
    upper_bound = 10
    finder = PrimeFinder.new
    this_arr = finder.find_primes upper_bound
    this_arr.class.should eql Array
  end

  it "should given lower bound of 2 and upper bound of 10 return an array with the correct prime numbers" do
    lower_bound = 2
    upper_bound = 10
    finder = PrimeFinder.new
    return_arr = finder.find_primes lower_bound, upper_bound
    return_arr.size.should eql 4
    return_arr[0].should eql 2
    return_arr[1].should eql 3
    return_arr[2].should eql 5
    return_arr[3].should eql 7
  end

  it "should given lower bound of 3 and upper bound of 10 return an array with the correct prime numbers" do
    lower_bound = 3
    upper_bound = 10
    finder = PrimeFinder.new
    return_arr = finder.find_primes lower_bound, upper_bound
    return_arr.size.should eql 3
    return_arr[0].should eql 3
    return_arr[1].should eql 5
    return_arr[2].should eql 7
  end

  it "should given only upper bound of 10 return an array with the correct prime numbers" do
    upper_bound = 10
    finder = PrimeFinder.new
    return_arr = finder.find_primes upper_bound
    return_arr.size.should eql 4
    return_arr[0].should eql 2
    return_arr[1].should eql 3
    return_arr[2].should eql 5
    return_arr[3].should eql 7
  end

  it "should if upper bound is 3 return an array with the correct prime numbers" do
    upper_bound = 3
    finder = PrimeFinder.new
    return_arr = finder.find_primes upper_bound
    return_arr.size.should eql 2
    return_arr[0].should eql 2
    return_arr[1].should eql 3
  end

  it "should return an empty array if upper bound 0 is passed into find_primes" do
    upper_bound = 0
    finder = PrimeFinder.new
    return_arr = finder.find_primes upper_bound
    return_arr.size.should eql 0
  end

end