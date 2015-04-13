class StaticController < ApplicationController
  def index
    @designs = Design.all
  end
end
