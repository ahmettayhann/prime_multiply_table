require 'active_support'
require 'active_support/core_ext'
require 'rspec/autorun'

class Multiplier
  def multiple(number = nil)
    number = 10 unless number.present?
    prime_list = prime_numbers(number)
    table = ''
    prime_list.unshift(0).each_with_index do |n, i| # unshift 0 is only becasue of the table's first element 
      prime_list.each_with_index do |m, x|
        table = if i.zero?
                  x.zero? ? 'X' : m.to_s
                else
                  x.zero? ? n.to_s : (m * n).to_s
                end
        print table.ljust(5, ' ')
        prime_list.drop(1) #after table created first element(0) of list removed
      end
      puts
      puts
    end
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

describe Multiplier do
  it "multiple prime numbers" do
    multiplier = Multiplier.new.multiple.drop(1)

    expect(multiplier).to eq([2, 3, 5, 7, 11, 13, 17, 19, 23, 29])
  end

  it "multiple N prime numbers" do
    multiplier = Multiplier.new.multiple(4).drop(1)

    expect(multiplier).to eq([2, 3, 5, 7])
  end
end
