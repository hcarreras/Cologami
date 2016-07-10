class PriceCalculator
  def price_for quantity
    case quantity.to_s
      when "5"
        Money.new(400, "EUR")
      when "10"
        Money.new(500, "EUR")
      when "20"
        Money.new(900, "EUR")
      when "50"
        Money.new(2000, "EUR")
      when "100"
        Money.new(3500, "EUR")
      when "500"
        Money.new(15000, "EUR")
      when "1000"
        Money.new(25000, "EUR")
      when "other_quantity"
        "other_quantity"
    end
  end
end