require "pry"
require "rspec"
require "./lib/card"
require "./lib/turn"
require "./lib/deck"
require "./lib/round"

RSpec.describe Turn do
  it "exists" do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn).to be_instance_of(Turn)
  end

  it "makes a guess" do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn.guess).to eq("Juneau")
  end

  it "is correct and gives feedback" do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn.correct?).to be(true)
    expect(turn.feedback).to eq("Correct!")

  end

  it "is incorrect and gives feedback" do
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)

    expect(turn.guess).to eq("Saturn")
    expect(turn.correct?).to be(false)
    expect(turn.feedback).to eq("Incorrect.")
  end
end
