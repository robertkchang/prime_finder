#
# Uses the Sieve of Eratosthenes algorithm to find the prime_finder numbers given an upper bound
#
class PrimeFinder

  def find_primes *bounds

    if bounds.size==0 || bounds.size > 2
      raise "Either specify a lower bound and upper bound OR just the upper bound."
    end

    if bounds.size == 1
      lower_bound = 2
      upper_bound = bounds[0]
    else
      lower_bound = bounds[0]
      upper_bound = bounds[1]
    end

    sqrt_upper = (Math.sqrt upper_bound).round
    working_arr = Array.new(upper_bound) {|e| e =  false}
    return_arr = []

    (2 .. sqrt_upper).each { |m|
      if !working_arr[m]

        if m >= lower_bound
          return_arr << m
        end

        k = m * m
        while k <= upper_bound
          working_arr[k] = true
          k += m
        end
      end
    }

    (sqrt_upper+1 .. upper_bound).each { |n|
      if !working_arr[n] && n >= lower_bound
        return_arr << n
      end
    }

    return_arr

  end

  ########
  # Main #
  ########

  if $0 == __FILE__
    finder = PrimeFinder.new
    if ARGV.size == 0
      puts "USAGE: ruby prime_finder.rb <lower bound> <upper bound>"
      puts "OR: ruby prime_finder.rb <upper bound>"
      puts "EXAMPLE: ruby prime_finder.rb 30"
      puts "EXAMPLE: ruby prime_finder.rb 2 30"
    else
      bounds = ARGV[0,(ARGV.length)].collect{|i| i.to_i}
      puts finder.find_primes *bounds
    end
  end
end