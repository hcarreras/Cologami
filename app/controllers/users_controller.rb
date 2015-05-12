class UsersController < InheritedResources::Base
  actions :index

  def show
    redirect_to root_url unless current_user
  end
end
