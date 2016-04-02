class LineItemsController < InheritedResources::Base
  skip_before_filter :authorize
  actions :create, :destroy
  before_action :set_cart

  def create
    @line_item = current_cart.line_items.where(shape_id: create_params['shape_id']).first_or_initialize
    @line_item.quantity = create_params['quantity'].to_i

    respond_to do |format|
      if @line_item.save
        format.html {redirect_to new_purchase_path}
      else
        format.html do
          redirect_to :back, alert: @line_item.errors.full_messages.to_sentence
        end
      end
    end
  end

  private

  def create_params
    params.require(:line_item).permit(:quantity, :shape_id)
  end
end
