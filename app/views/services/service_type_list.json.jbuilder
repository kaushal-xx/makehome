json.orders @service_types do |service_type|
	json.id service_type.id
	json.name service_type.name
	json.image service_type.image
end