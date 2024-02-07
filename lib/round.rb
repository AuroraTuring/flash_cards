class Round
  attr_reader :deck, :turns, :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
  end

  def current_card
    @deck.cards[turns.count]
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    if turn.correct?
      @number_correct += 1
    end
    @turns << turn
    turn
  end

  def number_correct_by_category(category)
    @turns.count do |turn|
      turn.card.category == category && turn.correct?
    end
  end

  def percent_correct
    (@number_correct.to_f / @turns.count) * 100
  end

  def percent_correct_by_category(category)
    number_correct = @turns.count do |turn|
      turn.card.category == category && turn.correct?
    end
    number_correct.to_f * 100
  end

end
