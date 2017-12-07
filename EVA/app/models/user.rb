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


has_attached_file :user_img, 
styles:
{
   thumb: '100x100>',
    square: '200x200#',
     medium: '300x300>',
    large: '600x600>'
},

:path => "/:myusernormalized" ,
:storage => :s3,
    :bucket => 'evatr',
    :s3_credentials => {
        access_key_id:  ENV['AKIAJYIW7UOKM47P42KQ'],
    secret_access_key:  ENV['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'],
            s3_region:  ENV['us-west-2']
    }

    validates_attachment_content_type :user_img, :content_type => /\Aimage\/.*\Z/

Paperclip.interpolates :myusernormalized do |attachment, style|
    attachment.instance.myusernormalized
  end

  def myusernormalized
  "company#{self.id}/:class/:id"
  end

  def default_admin
    if self.rol == nil
      #self.company_id ||= self.company.id
      self.rol ||= "Transportista"
    
    end


  end


end
