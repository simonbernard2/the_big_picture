require 'test_helper'

class UploadControllerTest < ActionDispatch::IntegrationTest

  test 'should not be able to create mosaic without image_url' do
    get make_mosaic_url
    response = JSON.parse(@response.body)
    assert_equal 'missing image_url param', response['message']
  end

  test 'should not be able to create mosaic without resolution' do
    get make_mosaic_url, params: { image_url: 'https://i.imgur.com/VLL0Imub.jpg', size: 10 }
    response = JSON.parse(@response.body)
    assert_equal 'missing resolution param', response['message']
  end

  test 'should not be able to create mosaic without size' do
    get make_mosaic_url, params: { image_url: 'https://i.imgur.com/VLL0Imub.jpg', resolution: 10 }
    response = JSON.parse(@response.body)
    assert_equal 'missing size param', response['message']
  end

  test 'should add 8 pictures to db' do
    assert_difference 'Picture.count', 8 do
      json = JSON.parse(file_fixture('images_urls.json').read)
      post upload_images_url, params: json
    end
  end

  test 'should suggest to increase resolution' do
    get make_mosaic_url, params: { image_url: 'https://i.imgur.com/VLL0Imub.jpg', size: 10, resolution: 1 }
    response = JSON.parse(@response.body)
    assert_equal "can't generate grid, try increasing resolution", response['message']
  end

end
