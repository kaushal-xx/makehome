class Profile < ApplicationRecord
	belongs_to :service, optional: true
	belongs_to :builder, optional: true
end
