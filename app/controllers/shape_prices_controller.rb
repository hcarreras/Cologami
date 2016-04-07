class ShapePricesController < ApplicationController
  def show
    @shape = Shape.find(params[:id])
    @price = PriceCalculator.new.price_for(params[:quantity])
    render template: "shapes/show.js"
  end
end
