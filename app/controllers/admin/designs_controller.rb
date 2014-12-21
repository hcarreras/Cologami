class Admin::DesignsController < InheritedResources::Base
  actions :all, :except => [:show]

  def new
    @design = Design.new
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
        format.html { redirect_to admin_designs_path, notice: 'Design was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    @design = Design.find(params[:id])

    respond_to do |format|
      if @design.update_attributes(params[:design_params])
        if params[:images]
          params[:images]['file'].each do |a|
            @design.images.delete_all
            @design.images.create!(file: a, design_id: @design.id)
          end
        end
        format.html { redirect_to admin_designs_path, notice: 'Design was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end  end

  private

  def design_params
    params.require(:design).permit(:title, :price, :description, :tutorial_url, :shape_id, :user_id)
  end
end

