# encoding: utf-8

class SheetUploader < CarrierWave::Uploader::Base
  def store_dir
    "uploads/sheets/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
end
