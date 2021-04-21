json.orders @service_types do |service_type|
	json.id service_type.id
	json.name service_type.name
	json.price service_type.price
	json.active service_type.active
	json.image service_type.image
	json.coming_soon service_type.coming_soon
end