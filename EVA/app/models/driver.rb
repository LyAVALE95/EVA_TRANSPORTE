class Driver < ApplicationRecord
  belongs_to :user
  belongs_to :company
  has_many :trucks, :dependent => :destroy
end
