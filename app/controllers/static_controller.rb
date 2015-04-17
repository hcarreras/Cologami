class StaticController < ApplicationController
  def index
    @designs = Design.all
  end

  def show
    render template: "static/#{params[:id]}"
  end
end
