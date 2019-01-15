class Board
  attr_accessor :cups
  #      12  11  10  9  8  7
  #  [store2]            [store1]
  #       1   2   3  4  5  6
  # 12 11 10 9 8 7 [13][6] 0  1   2   3   4   5
  # 0  1  2  3 4 5  6   7  8  9  10  11  12  13

  def initialize(name1, name2)
    @cups = Array.new(14) {|el| el = []}
    place_stones 
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    self.cups.each_with_index do |cup, i|
      if i != 6 && i != 13
        4.times {cup << :stone}
      end
    end
  end

  def valid_move?(start_pos)
    raise 'Invalid starting cup' if start_pos > 13 || start_pos < 0
    raise 'Starting cup is empty' if self.cups[start_pos].empty?
  end
 
  def make_move(start_pos, current_player_name)
    num_stones = self.cups[start_pos].length
    self.cups[start_pos] = []
    cup_to_miss = 6 if start_pos.between?(1,6)
    cup_to_miss = 7 if start_pos.between?(7,12)
    curr_cup = start_pos 
    end_pos = nil
    while num_stones > 0
      curr_cup = ((curr_cup + 1) % 14)
      end_pos = curr_cup if num_stones == 1
      unless curr_cup == cup_to_miss
        self.cups[curr_cup] << :stone 
        num_stones -= 1
      end
    end
    render 
    next_turn (end_pos)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
  end

  def winner
  end
end
