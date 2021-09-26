# app/services/tweet_creator.rb
class GridGenerator
  def initialize(picture, size, resolution)
    @picture = picture
    @size = size
    @resolution = resolution
    set_dimensions
  end

  def set_dimensions
    ratio = @picture.ratio
    horizontal_tiles_count = @size
    vertical_tiles_count = (horizontal_tiles_count / ratio).to_i
    @width = horizontal_tiles_count
    @height = vertical_tiles_count
  end

  def make_picture_hash
    arr = []
    color_hash = @picture.make_color_hash(@width, @height)
    color_hash.each_with_index do |row, row_index|
      row.each_with_index do |col, col_index|
        picture = find_matching_picture(col)
        return false unless picture

        arr << { picture_id: picture.id, x: row_index, y: col_index }
      end
    end
    arr
  end

  def find_matching_picture(rgb)
    red = rgb[:red]
    green = rgb[:green]
    blue = rgb[:blue]
    pic = Picture.where(red_value: (red - @resolution)..(red + @resolution),
                        green_value: (green - @resolution)..(green + @resolution),
                        blue_value: (blue - @resolution)..(blue + @resolution)).sample(1).first
    false unless pic
    pic
  end

end
