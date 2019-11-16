class Card

  # DECK = [Card.new("A"), Card.new("K"), Card.new("Q"), Card.new("J"), Card.new("A"), Card.new("K"), Card.new("Q"), Card.new("J")] 
    CARD_FACES = [:A, :K, :Q, :J, :B, :R, :N, :P]

  def self.make_deck(num_cards)
    not_used_faces = CARD_FACES.dup
    deck = []
    (num_cards / 2).times do |i|
        face = not_used_faces.sample
        not_used_faces.delete(face)

        if not_used_faces.empty?
            not_used_faces = CARD_FACES.dup
        end

        2.times do
            deck << Card.new(face)
        end
    end
    deck.shuffle
  end

  attr_reader :face, :hidden

  def initialize(face)
    @face = face
    @hidden = [true, false].sample
  end

  def hide
    @hidden = true
  end
  
  def reveal
    @hidden = false
  end

  def ==(other_card)
    self.face == other_card.face
  end

end