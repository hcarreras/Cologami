class Admin::ShapesController < Admin::AdminController
  inherit_resources
  actions :all, except: :show

  private

  def shape_params
    params.require(:shape).permit(:title, :tutorial_url)
  end
end