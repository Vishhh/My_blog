class Post < ActiveRecord::Base

  mount_uploader :image_name, AvatarUploader 
  has_many :images, as: :imageable
  accepts_nested_attributes_for :images

  has_many :comments
  belongs_to :user
  scope :all_publish, -> {where(publish: true)}

 

end
