class ServiceTypeMapping < ApplicationRecord
	belongs_to :service
	belongs_to :service_type
end
