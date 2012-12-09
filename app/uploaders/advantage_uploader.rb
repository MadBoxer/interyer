# encoding: utf-8

class AdvantageUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Include the Sprockets helpers for Rails 3.1+ asset pipeline compatibility:
  # include Sprockets::Helpers::RailsHelper
  # include Sprockets::Helpers::IsolatedHelper

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog
  process :resize_to_fill => [30,30]
  #process :resize_and_round => ['30x30', 20]
  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/advantages/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  
  def resize_and_round(geometry_string, radius=10)
    manipulate! do |original|
      original.change_geometry(geometry_string) do |cols, rows, img| 
  
        # Make a resized copy of the image
        thumb = img.resize(cols, rows)
  
        # Set a transparent background: pixels that are transparent will be
        # discarded from the source image.
        mask = Magick::Image.new(cols, rows) {self.background_color = 'transparent'}
  
        # Create a white rectangle with rounded corners. This will become the
        # mask for the area you want to retain in the original image.
        Magick::Draw.new.stroke('none').stroke_width(0).fill('white').
            roundrectangle(0, 0, cols, rows, radius, radius).
            draw(mask)
  
        # Apply the mask and write it out
        thumb.composite!(mask, 4,4, Magick::CopyOpacityCompositeOp)
        thumb
      end
    end
  end
  
    # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process :scale => [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_white_list
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
