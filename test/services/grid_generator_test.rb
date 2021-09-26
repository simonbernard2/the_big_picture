require "test_helper"

class GridGeneratorTest < ActionDispatch::IntegrationTest
  setup do
    @picture = pictures(:one)
    @grid = GridGenerator.new(@picture, 10, 40)
    @grid_resolution_too_high = GridGenerator.new(@picture, 10, 2)
  end

  test 'should return picture_hash' do
    assert @grid.make_picture_hash
  end

  test 'should_not return picture_hash' do
    assert_not @grid_resolution_too_high.make_picture_hash
  end

  test 'should return black image' do
    rgb = { red: 0, green: 0, blue: 0 }
    assert_equal 'black', @grid.find_matching_picture(rgb).title
  end
end
