class UploadController < ApplicationController
  def make_mozaic
    return render json: { status: 'error', message: 'missing image_url param' } if params[:image_url].blank?
    return render json: { status: 'error', message: 'missing size param' } if params[:size].blank?
    return render json: { status: 'error', message: 'missing resolution param' } if params[:resolution].blank?

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
    urls = params[:urls].split(',')
    urls.each do |url|
      picture = Picture.find_or_create_by(image_url: url)
      picture.save
    end
    render json: {status: 'ok', message: 'images successfully uploaded'}
  end
end

urls = %w[https://i.imgur.com/BOBnmUHb.jpg https://i.imgur.com/WOPSGj9b.jpg https://i.imgur.com/u1R691ib.jpg https://i.imgur.com/jZlovODb.jpg]
