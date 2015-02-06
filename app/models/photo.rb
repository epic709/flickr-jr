require 'carrierwave/orm/activerecord'

class Photo < ActiveRecord::Base
  # Remember to create a migration!
  mount_uploader :avatar, AvatarUploader
  belongs_to :user
end
