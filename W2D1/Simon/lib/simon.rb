class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until @game_over
      take_turn
    end

    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence

    unless @game_over
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    puts "This is the sequence:"
    @seq.each do |color|
      puts color
      sleep(1)
      system("clear")
      sleep(.5)
    end
  end

  def require_sequence
    puts "Did you catch that? Let's find out!"
    @seq.each do |color|
      answer = gets.chomp
      if answer[0] != color[0]
        @game_over = true
        break
      end
    end

  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts "Congratulations! You passed round #{@sequence_length}!"
    puts "Unfortunately, it only gets harder from here."
  end

  def game_over_message
    puts "Sorry, but that was incorrent! You lose!"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
