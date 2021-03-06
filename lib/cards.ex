defmodule Cards do
  @moduledoc """
  Provides functions for creating and handling a deck of cards
  """


  @doc """
  Returns a list of strings representing a deck of playing cards

  ## Examples

      iex> deck = Cards.create_deck
      iex> {hand, deck} = Cards.deal(deck, 1)
      iex> hand
      ["Ace of Spades"]

  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five", "Six",
    "Seven", "Eight", "Nine" , "Ten", "Jack", "Queen", "King"]
    suits = ["Spades", "Hearths","Clubs", "Diamonds"]

    for value <- values, suit <- suits do
        "#{value} of #{suit}"
    end
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end


  @doc """
    Determines whether deck contains a certain card

  ## Examples

      iex> deck = Cards.create_deck
      iex> Cards.contains?(deck, "Ace of Spades")
      true

  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
  Divides a deck into a hand and the remainder of the deck.
  The `hand_size` argument indicated how many cards should be in
  the hand
  """
  def deal(deck, hands_size) do
    Enum.split(deck, hands_size)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    case File.read(filename) do
      {:ok, binary} ->   :erlang.binary_to_term(binary)
      {:error, _reason} -> "That file does not exist"
    end
  end

  def create_hand(hand_size) do
      Cards.create_deck
      |> Cards.shuffle
      |> Cards.deal(hand_size)
  end
end
