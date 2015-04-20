class LineItemsController < InheritedResources::Base
  skip_before_filter :authorize
  actions :create, :destroy
  before_action :set_cart

  def create
    @design = Design.find(params[:design_id])
    @line_item = @cart.add_design(@design.id)
    respond_to do |format|
      if @line_item.save
        format.html {redirect_to cart_path(current_cart), notice: "Diseño añadido al carrito"}
      else
        format.html do
          redirect_to :back, alert: @line_item.errors.full_messages.to_sentence
        end
      end
    end
  end
end
