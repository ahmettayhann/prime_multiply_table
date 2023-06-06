require 'active_support'
require 'active_support/core_ext'

puts 'Enter number of prime number'

number = gets.chomp.to_i
number = 10 if number.zero?

def multiple(number = nil)
  table = ''
  prime_list = prime_numbers(number)
  prime_list.unshift(0)
  prime_list.each_with_index do |n, i|
    prime_list.each_with_index do |m, x|
      table = if i.zero?
                x.zero? ? 'X' : m.to_s
              else
                x.zero? ? n.to_s : (m * n).to_s
              end
      print table.ljust(5, ' ')
    end
    puts
  end
end

def prime_numbers(number)
  prime_list = []
  i = 2
  while prime_list.count < number
    prime_list << i if prime?(i, prime_list)
    i += 1
  end
  prime_list
end

def prime?(number, prime_list)
  prime_list.each { |prime| return false if (number % prime).zero? }
  true
end

print multiple(number).drop(1)
