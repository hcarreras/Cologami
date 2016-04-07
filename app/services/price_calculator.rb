class PriceCalculator
  def price_for quantity
    case quantity.to_s
      when "5"
        4
      when "10"
        5
      when "20"
        8
      when "other_quantity"
        "other_quantity"
    end
  end
end