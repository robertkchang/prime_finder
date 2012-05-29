#
# Uses the Sieve of Eratosthenes algorithm to find the prime_finder numbers given an upper bound
#
class PrimeFinder

  def find_prime (upper_bound)

    sqrt_upper = (Math.sqrt upper_bound).round
    working_arr = Array.new(upper_bound) {|e| e =  false}
    return_arr = Array[]

    for m in 2 .. sqrt_upper
      if !working_arr[m]
        return_arr << m
        k = m * m
        while k <= upper_bound
          working_arr[k] = true
          k += m
        end
      end
    end

    for n in sqrt_upper+1 .. upper_bound
      if !working_arr[n]
        return_arr << n
      end
    end

    return_arr

  end

  ########
  # Main #
  ########

  finder = PrimeFinder.new

  if ARGV.size == 0
    puts ("USAGE: ruby prime_finder.rb <upper bound>")
    puts ("EXAMPLE: ruby prime_finder.rb 30")
  else
    if ARGV.size == 1 && ARGV[0].to_i != 0
      upper_bound = ARGV[0].to_i
      puts finder.find_prime(upper_bound)
    end
  end
end