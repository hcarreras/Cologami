class Design::Image < ActiveRecord::Base
  mount_uploader :file, ImageUploader
  belongs_to :design
end