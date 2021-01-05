class Builder < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable
  acts_as_token_authenticatable

  has_one :profile

  #=============== Nested attributes =============================
  accepts_nested_attributes_for :profile
end
