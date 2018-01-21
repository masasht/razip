class ImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::RMagick
  storage :fog
  process convert: 'jpg'
  
  process :resize_to_fill => [900, 600]
  
  def default_url
    "https://s3-ap-northeast-1.amazonaws.com/rc-car-clip/uploads/no_image/thumb_noimage.png"
  end
  
  # 保存するディレクトリ名
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  # thumb バージョン(サムネイルリサイズ)
  version :thumb do
    process :resize_to_fill => [300, 200]
  end
  # 許可する画像の拡張子
  def extension_white_list
    %W[jpg jpeg gif png]
  end
  # 変換したファイルのファイル名の規則
  def filename
    "#{model.class.to_s.underscore}-rc-car-clip.jpg" if original_filename.present?
  end
end