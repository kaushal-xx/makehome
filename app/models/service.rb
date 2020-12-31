class Service < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable
  acts_as_token_authenticatable

	has_many :service_type_mappings
	has_many :service_types, through: :service_type_mappings
end
