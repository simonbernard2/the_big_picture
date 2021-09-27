# == Schema Information
#
# Table name: pictures
#
#  id          :bigint           not null, primary key
#  title       :string(255)
#  subtitle    :string(255)
#  image_url   :string(255)
#  width       :integer
#  height      :integer
#  ratio       :float(24)
#  red_value   :integer
#  green_value :integer
#  blue_value  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'rmagick'

class Picture < ApplicationRecord
  include Magick
  validates :image_url, presence: true

  def initialize(attributes = {})
    super
    return unless valid?

    set_dimensions
    set_ratio
    set_rgb_values
  end

  def magick_image
    Magick::Image.read(image_url)[0]
  end

  def make_color_hash(rows, cols)
    return false if (rows < 2 || cols < 2)

    img = magick_image
    tile_width = width.to_f / rows
    tile_height = height.to_f / cols
    (0..rows).collect { |h|
      (0..cols).collect { |v|
        img.crop(0, h * 100, tile_width, tile_height, true)
      }.map { |t| get_rgb_values(t) } }
  end

  def get_rgb_values(img)
    pix = img.scale(1, 1)
    rgb = {}
    rgb[:red] = pix.pixel_color(0, 0).red / 257
    rgb[:green] = pix.pixel_color(0, 0).green / 257
    rgb[:blue] = pix.pixel_color(0, 0).blue / 257
    rgb
  end

  def set_rgb_values
    img = magick_image
    rgb = get_rgb_values(img)
    self.red_value = rgb[:red]
    self.green_value = rgb[:green]
    self.blue_value = rgb[:blue]
  end

  def self.find_matching_picture(red, green, blue, resolution)
    where(red_value: (red - resolution)..(red + resolution),
          green_value: (green - resolution)..(green + resolution),
          blue_value: (blue - resolution)..(blue + resolution)).sample(1).first
  end

  private

  def set_dimensions
    img = magick_image
    self.width = img.columns
    self.height = img.rows
  end

  def set_ratio
    self.ratio = (width.to_f / height).round(1)
  end
end
