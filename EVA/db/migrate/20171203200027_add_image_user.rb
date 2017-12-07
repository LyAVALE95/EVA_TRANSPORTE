class AddImageUser < ActiveRecord::Migration[5.1]
  def change
  	add_attachment :users, :user_img
  end
end
