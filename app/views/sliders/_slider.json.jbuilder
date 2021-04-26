json.extract! slider, :id, :name, :slider_type, :visibility, :created_at, :updated_at, :images, :service_type_id
# json.array! slider.images, partial: "images/image", as: :image
json.url slider_url(slider, format: :json)
