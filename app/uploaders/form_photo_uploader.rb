class FormPhotoUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  #storage :file
  storage :fog
  
  # cash使います。
  def fog_attributes
    {
      'Content-Type' =>  'image/jpg',
      'Cache-Control' => "max-age=#{1.week.to_i}"
    }
  end

  # バケット以下アイコンの保存先を指定します。
  # ~/[バケット名]/[foldername]　配下に画像がアップロードされます。 
  def store_dir
    "[foldername]"
  end

  # アップロード可能な形式をここで指定します。
  # ちなみにアップロード不可な形式の指定はextension_black_list
  def extension_white_list
    %w(jpg jpeg png)
  end

  # アップロード時のファイル名を指定します。
  # アップロードしたファイルを一意に認識
  def filename
    if original_filename.present?
      "#{model.id}_#{secure_token}.#{file.extension}"
    end
  end
  
  version :thumb do
    process :crop
    process :resize_to_limit => [100, 100]
  end

  def crop
    manipulate! do |img|
      gravity = Magick::CenterGravity # 中央から切り取ります。
      crop_w = img.columns
      crop_h = img.rows
      # 画像のサイズが縦横違った場合は小さい方に合わせてトリミングする。
      if img.rows <= img.columns
        crop_w = img.rows
      else
        crop_h = img.columns
      end
      img.crop!(gravity, crop_w, crop_h)
      img = yield(img) if block_given?
      img
    end
  end
  
  protected
  def secure_token
    var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.uuid)
  end

end

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  #def store_dir
  #  "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  #end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url(*args)
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process scale: [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process resize_to_fit: [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_whitelist
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

