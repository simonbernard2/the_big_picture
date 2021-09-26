class UploadController < ApplicationController
  def upload
    main_picture = Picture.find_or_create_by(image_url: params[:url])
    main_picture.save
    size = params[:size].to_i
    resolution = params[:resolution].to_i
    grid = GridGenerator.new(main_picture, size, resolution)
    data = grid.make_picture_hash
    return render json: { status: 'error', message: "can't generate grid, try increasing resolution" } unless data

    render json: { status: 'ok', data: data }
  end
end
