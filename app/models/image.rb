class Image < ActiveRecord::Base
  
  mount_uploader :image_name, AvatarUploader
  belongs_to :imageable, polymorphic: true
  belongs_to :user
  belongs_to :post

end
