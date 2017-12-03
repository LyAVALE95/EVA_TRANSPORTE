class Audit < ApplicationRecord
	 validates :results, presence: true
  	 validates :description, presence: true
end
