class User < ApplicationRecord
 # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

     # attr_accessor :name, :lastName, :rol
  before_save :default_admin
   # belongs_to :company
#accepts_nested_attributes_for :company
 # accepts_nested_attributes_for :company
  acts_as_token_authenticatable



  def default_admin
    if self.rol == nil
      #self.company_id ||= self.company.id
      self.rol ||= "Transportista"
    
    end


  end


end
