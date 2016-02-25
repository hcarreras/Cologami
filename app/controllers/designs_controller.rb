class DesignsController < InheritedResources::Base
  actions :show

  def show
    @design = Design.find(params[:id])
    @line_item = LineItem.new
  end
end

