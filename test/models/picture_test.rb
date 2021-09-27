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
require "test_helper"

class PictureTest < ActiveSupport::TestCase
  test 'should not save picture without url' do
    picture = pictures(:no_pic)
    assert_not picture.save
  end

  test 'should save picture with url' do
    url = "#{file_fixture_path}/sky.jpeg"
    picture = Picture.new(image_url: url)
    assert_difference 'Picture.count' do
      picture.save
    end
  end

  test 'dimensions should be set correctly' do
    url = "#{file_fixture_path}/sky.jpeg"
    picture = Picture.new(image_url: url)

    expected_width = 160
    expected_height = 160
    actual_width = picture.width
    actual_height = picture.height

    assert_equal expected_width, actual_width
    assert_equal expected_height, actual_height
  end

  test 'should correctly set rgb values' do
    url = "#{file_fixture_path}/black_square.jpeg"
    picture = Picture.new(image_url: url)
    expected = [0, 0, 0]
    actual = [picture.red_value, picture.green_value, picture.blue_value]

    assert_equal expected, actual
  end

  test 'should return the white square picture' do
    url = "#{file_fixture_path}/white_square.jpeg"
    picture = Picture.new(image_url: url)
    picture.save
    expected = picture
    actual = Picture.find_matching_picture(255, 255, 255, 2)

    assert_equal expected, actual
  end

  test 'returns valid color hash' do
    expected = [[{ red: 189, green: 178, blue: 166 },
                 { red: 189, green: 178, blue: 166 },
                 { red: 189, green: 178, blue: 166 }],
                [{ red: 186, green: 169, blue: 153 },
                 { red: 186, green: 169, blue: 153 },
                 { red: 186, green: 169, blue: 153 }],
                [{ red: 181, green: 159, blue: 138 },
                 { red: 181, green: 159, blue: 138 },
                 { red: 181, green: 159, blue: 138 }]]
    actual = pictures(:two).make_color_hash(2, 2)

    assert_equal expected, actual
  end

  test 'should not generate a color hash from values less than two' do
    assert_not pictures(:two).make_color_hash(0, 0)
  end
end
