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
    picture = pictures(:one)
    assert picture.save
  end

  test 'dimensions should be set correctly' do
    assert_equal 1, pictures(:one).height
    assert_equal 1, pictures(:one).width

    pictures(:one).set_dimensions

    assert pictures(:one).height == 1920
    assert pictures(:one).width == 1080
  end

  test 'create color hash' do
    assert_equal 11, pictures(:two).make_color_hash(10,10).size
  end
end
