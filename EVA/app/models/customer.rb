class Customer < ApplicationRecord
  belongs_to :user
  belongs_to :company
  has_many :warehouses, :dependent => :destroy
  has_many :clientcontacts, :dependent => :destroy
end
