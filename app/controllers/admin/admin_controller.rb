class Admin::AdminController < ActionController::Base
  before_filter :verify_is_admin
  before_action :set_english_locale
  layout 'admin/application'

  private

  def set_english_locale
    I18n.locale = :en
  end

  def verify_is_admin
    (current_user.nil?) ? redirect_to(root_path) : (redirect_to(root_path) unless current_user.admin?)
  end
end