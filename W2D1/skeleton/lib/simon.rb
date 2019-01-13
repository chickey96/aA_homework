class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    take_turn
    until self.game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    self.sequence_length += 1
    require_sequence
    if !self.game_over 
      round_success_message
    end
  end

  def show_sequence
    add_random_color
    puts self.seq 
  end

  def require_sequence
    puts "Repeat the sequence! Type colors separated by commas (blue,red,green)"
    input = gets.chomp
    if input.split(",") != self.seq 
      self.game_over = true
    end 
  end

  def add_random_color
    self.seq << COLORS.sample
  end

  def round_success_message
    puts "You passed the round!"
  end

  def game_over_message
    puts "GAME OVER"
  end

  def reset_game
    self.sequence_length = 1
    self.game_over = false 
    self.seq = []
  end
end
