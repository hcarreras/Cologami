class Admin::DesignsController < Admin::AdminController
  inherit_resources
  actions :all, :except => [:index, :show]

  def new
    @design = Design.new
    @design.shape_id = params[:shape_id]
    @design_images = @design.images.build
    new!
  end

  def create
    @design = Design.new(design_params)

    respond_to do |format|
      if @design.save
        if params[:images]
          params[:images]['file'].each do |a|
            @design_image = @design.images.create!(file: a, design_id: @design.id)
          end
        end
        format.html { redirect_to admin_shapes_path, notice: 'Design was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    @design = Design.find(params[:id])

    respond_to do |format|
      if @design.update_attributes(design_params)
        if params[:images]
          @design.images.delete_all
          params[:images]['file'].each do |a|
            @design.images.create!(file: a, design_id: @design.id)
          end
        end
        format.html { redirect_to admin_shapes_path, notice: 'Design was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  private

  def design_params
    params.require(:design).permit(:title, :description, :tutorial_url, :shape_id, :user_id, :priority)
  end
end

