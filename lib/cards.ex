defmodule Cards do
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight",
      "Nine" , "Ten", "Jack", "Queen", "King"]
    suits = ["Spades", "Hearths","Clubs", "Diamonds"]

    cards = for suit <- suits do
      for value <- values do
        "#{value} of #{suit}"
      end
    end
    List.flatten(cards)
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end
end
