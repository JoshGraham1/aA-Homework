require_relative "card.rb"

class Board

    attr_accessor :grid

  def initialize
    @size = 4
    @grid = Array.new(@size) { Array.new(@size) }
    @deck = Card.make_deck(@size * @size)
  end

  def deck_to_grid
    @grid.each_with_index do |row, idx|
        row.each_with_index do |space, idx2|
            @grid[idx][idx2] = @deck.pop
        end
    end
  end

  def print_grid
    puts "  0 1 2 3"
    @grid.each_with_index do |row, idx|
        print "#{idx} "
        row.each_with_index do |card, idx2|
            if card.hidden
                print "_"
            else
                print card.face.to_s
            end 
            print " "
        end
        print "\n"
    end
  end

  def [](pos)
    row, column = pos
    @grid[row][column]
  end

  def reveal(pos)
    if @grid[pos].hidden = true
        @grid[pos].hidden = false
    end
  end

end