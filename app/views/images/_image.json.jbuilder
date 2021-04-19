json.extract! image, :id, :name, :image_type, :image_url, :visibility, :slider_id, :created_at, :updated_at
json.url image_url(image, format: :json)
