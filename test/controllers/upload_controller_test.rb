require 'test_helper'

class UploadControllerTest < ActionDispatch::IntegrationTest

  test 'should not be able to create mosaic without image_url' do
    get make_mosaic_url
    response = JSON.parse(@response.body)

    expected = 'missing image_url param'
    actual = response['message']

    assert_equal expected, actual
  end

  test 'should not be able to create mosaic without resolution' do
    url = "#{file_fixture_path}/sky.jpeg"
    get make_mosaic_url, params: { image_url: url, size: 10 }
    response = JSON.parse(@response.body)

    expected = 'missing resolution param'
    actual = response['message']

    assert_equal expected, actual
  end

  test 'should not be able to create mosaic if resolution is invalid' do
    url = "#{file_fixture_path}/sky.jpeg"
    get make_mosaic_url, params: { image_url: url, size: 'ekd', resolution: 10 }
    response = JSON.parse(@response.body)

    expected = 'invalid size param'
    actual = response['message']

    assert_equal expected, actual
  end

  test 'should not be able to create mosaic without size' do
    get make_mosaic_url, params: { image_url: 'https://i.imgur.com/VLL0Imub.jpg', resolution: 10 }
    response = JSON.parse(@response.body)

    expected = 'missing size param'
    actual = response['message']

    assert_equal expected, actual
  end

  test 'should not be able to create mosaic if size is invalid' do
    url = "#{file_fixture_path}/sky.jpeg"
    get make_mosaic_url, params: { image_url: url, size: 'ekd', resolution: 10 }
    response = JSON.parse(@response.body)

    expected = 'invalid size param'
    actual = response['message']

    assert_equal expected, actual
  end

  test 'should add 8 pictures to db' do
    assert_difference 'Picture.count', 8 do
      json = JSON.parse(file_fixture('images_urls.json').read)
      post upload_images_url, params: json
    end
  end

  test 'should suggest to increase resolution or size' do
    get make_mosaic_url, params: { image_url: 'https://i.imgur.com/VLL0Imub.jpg', size: 10, resolution: 1 }
    response = JSON.parse(@response.body)

    expected = "can't generate grid, try increasing resolution or size"
    actual = response['message']

    assert_equal expected, actual
  end

  test 'should return hash' do
    url = "#{file_fixture_path}/black_square.jpeg"
    get make_mosaic_url, params: { image_url: 'https://i.imgur.com/VLL0Imub.jpg', size: 10, resolution: 1 }
    response = JSON.parse(@response.body)

    expected = "can't generate grid, try increasing resolution or size"
    actual = response['message']

    assert_equal expected, actual
  end

end
