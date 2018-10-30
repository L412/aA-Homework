require "byebug"

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2

    @cups = Array.new(14) {[]}
    @cups = place_stones

  end

  def place_stones
    @cups.each.with_index do |arr, idx|
      unless [6, 13].include?(idx)
        4.times {arr << :stone}
      end
    end
  end

  def valid_move?(start_pos)

    if start_pos > 13 || start_pos < 0
      raise "Invalid starting cup"
    end

    if @cups[start_pos].empty?
      raise "Starting cup is empty"
    end

  end

  def make_move(start_pos, current_player_name)

    in_hand = @cups[start_pos].length
    @cups[start_pos] = []

    idx = start_pos + 1
    until in_hand == 0
      idx = idx % 14

      if idx == 6
        if current_player_name == @name1
          @cups[idx] << :stone
          in_hand -= 1
        end
      elsif idx == 13
        if current_player_name == @name2
          @cups[idx] << :stone
          in_hand -= 1
        end
      else
        @cups[idx] << :stone
        in_hand -= 1
      end

      idx += 1 unless in_hand == 0
    end

    render
    next_turn(idx)
  end

  def next_turn(idx)

    if idx == 6 || idx == 13
      return :prompt
    elsif @cups[idx].length == 1
      return :switch
    else
      return idx
    end

  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    return true if @cups[0..5].all?(&:empty?)
    return true if @cups[7..12].all?(&:empty?)
    false
  end

  def winner

    p1_score = @cups[6].count
    p2_score = @cups[13].count

    if p1_score > p2_score
      return @name1
    elsif p1_score < p2_score
      return @name2
    else
      :draw
    end
  end

end
