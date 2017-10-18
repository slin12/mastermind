require 'pry'

class Mastermind
  attr_reader :solution

  def initialize
    generate_solution
    @guess = []
  end

  def generate_solution
    colors = ['red', 'yellow', 'green', 'black', 'white']
    @solution = []
    4.times { solution << colors.sample }
    @solution
  end

  def get_guess
    puts "What's your guess? Colors: red, yellow, green, black, and white"
    guess = gets.chomp
    @guess = guess.split(" ")
  end

  def check_perfect
    perfect = 0
    @guess.each.with_index do |color, index|
      if color == @solution[index]
        @solution[index] = ""
        @guess[index] = ""
        perfect += 1
      end
    end
    perfect
  end

  def check_okay
    okay = 0
    @guess.each.with_index do |color, index|
      next if color == ""
      if @checker.include?(color)
        okay += 1
        @checker.delete_at(@checker.index(color) || @checker.length)
      end
    end
    okay
  end

  def check_against_solution #return ex. 1 perfect, 2 okay
    perfect = check_perfect
    okay = check_okay
    puts "#{perfect} perfect, #{okay} okay"
    binding.pry
  end
end
