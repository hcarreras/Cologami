class StaticController < ApplicationController
  def index
    @designs = Design.all
    @shape = Shape.first
    @line_item = LineItem.new
    @price = PriceCalculator.new.price_for(DEFAULT_QUANTITY)
  end

  def show
    render template: "static/#{params[:id]}"
  end
end
