class UploadController < ApplicationController
  protect_from_forgery

  def make_mosaic
    return render json: { status: 'error', message: 'missing image_url param' } if params[:image_url].blank?
    return render json: { status: 'error', message: 'missing size param' } if params[:size].blank?
    return render json: { status: 'error', message: 'invalid size param' } if params[:size].to_i < 2
    return render json: { status: 'error', message: 'missing resolution param' } if params[:resolution].blank?
    if params[:resolution].to_i < 1 || params[:resolution].to_i > 255
      return render json: { status: 'error', message: 'invalid resolution param' }
    end

    main_picture = Picture.find_or_create_by(image_url: params[:image_url])
    main_picture.save

    size = params[:size].to_i
    resolution = params[:resolution].to_i

    grid = GridGenerator.new(main_picture, size, resolution)
    data = grid.make_picture_hash
    return render json: { status: 'error', message: "can't generate grid, try increasing resolution" } unless data

    render json: { status: 'ok', data: data }
  end

  def upload_images
    urls = params[:urls]
    p params
    urls.each do |url|
      picture = Picture.find_or_create_by(image_url: url)
      picture.save
    end
    render json: { status: 'ok', message: 'images successfully uploaded' }
  end
end
