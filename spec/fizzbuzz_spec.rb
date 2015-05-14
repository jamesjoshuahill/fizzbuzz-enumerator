require_relative "../lib/fizzbuzz"

RSpec.describe FizzBuzz do
  context ".fizzit" do
    it "returns '1' for 1" do
      expect(described_class.fizzit(1)).to eq("1")
    end

    [3, 6, 9, 99].each do |multiple_of_three|
      it "returns 'Fizz' for #{multiple_of_three}" do
        expect(described_class.fizzit(multiple_of_three)).to eq("Fizz")
      end
    end

    [5, 10, 20, 50].each do |multiple_of_five|
      it "returns 'Buzz' for #{multiple_of_five}" do
        expect(described_class.fizzit(multiple_of_five)).to eq("Buzz")
      end
    end

    [15, 30, 45, 90].each do |multiple_of_fifteen|
      it "returns 'FizzBuzz' for #{multiple_of_fifteen}" do
        expect(described_class.fizzit(multiple_of_fifteen)).to eq("FizzBuzz")
      end
    end
  end

  context ".enumerator" do
    it "returns an enumerator" do
      expect(described_class.enumerator).to be_an Enumerator
    end

    it "starts from one by default" do
      expect(described_class.enumerator(1).next).to eq("1")
    end

    it "can start from fifteen" do
      expect(described_class.enumerator(15).next).to eq("FizzBuzz")
    end

    it "returns the enumeration form one to five" do
      enumerator = described_class.enumerator
      expect(enumerator.take(5)).to eq(%w(1 2 Fizz 4 Buzz))
    end

    it "returns the enumeration from fifteen to twenty-one" do
      enumerator = described_class.enumerator(15)
      expect(enumerator.take(6)).to eq(%w(FizzBuzz 16 17 Fizz 19 Buzz))
    end
  end
end
