class DesignsController < InheritedResources::Base

  private

    def design_params
      params.require(:design).permit(:title, :price, :description, :tutorial_url, :shape_id, :user_id)
    end
end

