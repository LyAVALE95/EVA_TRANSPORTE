class Company < ApplicationRecord
	 has_many :users
	  validates :name, presence: true
  	validates :legalName, presence: true
  	  validates :code, presence: true
  	    validates :tel, presence: true
  	      	    validates :active, presence: true

end

