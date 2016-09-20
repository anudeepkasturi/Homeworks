require 'byebug'

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @player1 = name1
    @player2 = name2
    set_cups_and_stones
  end

  def set_cups_and_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups = Array.new(14){Array.new(4){:stone}}
    @cups[6] = []
    @cups[13] = []
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" unless (1..14).to_a.include? start_pos
    raise "Cup is empty" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    # debugger
    current_pos = start_pos
    opponent_cup_pos = start_pos < 7 ? 13 : 6
    until @cups[current_pos].size == 1
      stones = empty_cup(current_pos)
      current_pos = distribute_stones(stones, current_pos, opponent_cup_pos)
      render
    end
    next_turn(current_pos)
  end

  def next_cup_pos(pos)
    pos += 1
    pos = 0 if pos == 14
    pos
  end

  def empty_cup(pos)
    stones = @cups[pos].size
    @cups[pos] = []
    stones
  end

  def distribute_stones(stones, start_pos, opponent_cup_pos)
    cup_pos = start_pos
    until stones.zero?
      cup_pos = next_cup_pos(cup_pos)
      unless cup_pos == opponent_cup_pos
        @cups[cup_pos] << :stone
        stones -= 1
      end
    end
    cup_pos
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    if [13, 6].include? ending_cup_idx
      :prompt
    else
      :switch
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def cups_empty?
    side_1_empty? || side_2_empty?
  end

  def side_1_empty?
    @cups[0..5].reduce(:+).empty?
  end

  def side_2_empty?
    @cups[7..12].reduce(:+).empty?
  end

  def winner
    @player1 if side_1_empty
    @player2 if side_2_empty
  end
end

if __FILE__ == $PROGRAM_NAME
  Board.new("a", "b").make_move(3, "a")
end
