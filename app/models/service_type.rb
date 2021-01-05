class ServiceType < ApplicationRecord
	has_many :service_type_mappings
	has_many :services, through: :service_type_mappings
end
