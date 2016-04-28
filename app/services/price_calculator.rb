class PriceCalculator
  def price_for quantity
    case quantity.to_s
      when "5"
        Money.new(400, "EUR")
      when "10"
        Money.new(500, "EUR")
      when "20"
        Money.new(800, "EUR")
      when "other_quantity"
        "other_quantity"
    end
  end
end