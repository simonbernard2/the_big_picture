require "test_helper"

class GridGeneratorTest < ActionDispatch::IntegrationTest
  setup do
    @black_grid = GridGenerator.new(pictures(:black), 2, 1)
    @high_resolution_grid = GridGenerator.new(pictures(:one), 5, 2)
  end

  test 'should return picture_hash' do
    id = pictures(:black).id
    expected = [{ picture_id: id, x: 0, y: 0 },
                { picture_id: id, x: 0, y: 1 },
                { picture_id: id, x: 0, y: 2 },
                { picture_id: id, x: 0, y: 3 },
                { picture_id: id, x: 1, y: 0 },
                { picture_id: id, x: 1, y: 1 },
                { picture_id: id, x: 1, y: 2 },
                { picture_id: id, x: 1, y: 3 },
                { picture_id: id, x: 2, y: 0 },
                { picture_id: id, x: 2, y: 1 },
                { picture_id: id, x: 2, y: 2 },
                { picture_id: id, x: 2, y: 3 }]
    actual = @black_grid.make_picture_hash

    assert_equal expected, actual
  end

  test 'should_not return picture_hash' do
    assert_not @high_resolution_grid.make_picture_hash
  end

  test 'should return black square image' do
    rgb = { red: 0, green: 0, blue: 0 }
    expected = pictures(:black)
    actual = @black_grid.find_matching_picture(rgb)
    assert_equal expected, actual, 'did not return the black square picture'
  end
end
