class CarrierLine < ApplicationRecord
	validates :name, presence: true
	validates :legalName, presence: true
	validates :tel, presence: true
	validates :mail, presence: true
	validates :comercialBusiness, presence: true
	validates :code, presence: true
	
end
