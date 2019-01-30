class Item < ApplicationRecord
  belongs_to :user
  belongs_to :status
  belongs_to :category

  mount_uploader :image, ImageUploader
end
