class Item < ApplicationRecord
  has_many :order_items

  default_scope { where(active: true) }
  validates(
    :name,
    presence: true,
    uniqueness: true,
    length: { minimum:3 } )
  validates(
    :description,
    presence: true,
    length: { maximum:400 } )
  validates(
    :category,
    presence: true,
    length: { minimum:3, maximum:20 } )
  validates(
    :price,
    numericality: true,
    presence: true )
  mount_uploader :picture, PictureUploader


end
