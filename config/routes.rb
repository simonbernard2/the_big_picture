Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post 'upload_images', to: 'upload#upload_images'
  post 'make_mosaic', to: 'upload#make_mosaic'
end
