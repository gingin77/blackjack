Card = Struct.new(:rank, :suit) do
  def ==(other)
    self.rank == other.rank &&
      self.suit == other.suit
  end
end

# ^^ taken from step 10 here  https://guides.onlinedevschool.com/build-a-deck-of-cards.html
