class StaticController < ApplicationController
  def index
    @designs = Design.all.order(priority: :desc)
    @shape = Shape.first
    @line_item = LineItem.new
    @price = PriceCalculator.new.price_for(DEFAULT_QUANTITY)
    render layout: "layouts/index"
  end

  def show
    render template: "static/#{params[:id]}"
  end
end
