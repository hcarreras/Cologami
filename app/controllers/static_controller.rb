class StaticController < ApplicationController
  def index
    @designs = Design.all
    @shape = Shape.first
    @line_item = LineItem.new
  end

  def show
    render template: "static/#{params[:id]}"
  end
end
