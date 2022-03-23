class BusinessUnit < ApplicationRecord
  validates :name, :phone, :email, :address, presence: true
end
