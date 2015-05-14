module MultipleOf
  refine Integer do
    def multiple_of?(x)
      self.modulo(x).zero?
    end
  end
end

module FizzBuzz
  using MultipleOf

  FIZZ = "Fizz"
  BUZZ = "Buzz"
  FIZZBUZZ = FIZZ + BUZZ

  def self.fizzit(n)
    return FIZZBUZZ if n.multiple_of?(15)
    return FIZZ if n.multiple_of?(3)
    return BUZZ if n.multiple_of?(5)
    n.to_s
  end

  def self.enumerator(from = 1)
    Enumerator.new do |yielder|
      n = from
      loop do
        yielder << fizzit(n)
        n += 1
      end
    end
  end
end
