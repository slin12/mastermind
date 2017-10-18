require_relative './Mastermind.rb'

class Interface
  def initialize
    @game = Mastermind.new
    run
  end

  def welcome
    puts "Welcome to Mastermind! Try to guess the Computer's secret code."
    puts "There are 4 slots and 5 colors - red, yellow, green, black, and white."
    puts "When prompted, input your guess like so: red red red red"
  end

  def run
    welcome
    puts "Would you like (E)asy, (N)ormal, or (H)ard difficulty?"
    answer = gets.chomp
    if answer == 'E'
      loop do
        @game.get_guess
        @game.check_against_solution
        if @game.check_perfect == 4
          puts "You win!"
          break
        end
      end
    elsif answer == 'N'
      12.times do
        @game.get_guess
        @game.check_against_solution
        if @game.check_perfect == 4
          puts "You win!"
          break
        end
      end
    elsif answer == 'H'
      5.times do
        @game.get_guess
        @game.check_against_solution
        if @game.check_perfect == 4
          puts "You win!"
          break
        end
      end
    else
      puts "Invalid Input"
    end
  end
end
