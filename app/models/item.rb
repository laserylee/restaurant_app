# == Schema Information
#
# Table name: items
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  category    :string
#  picture     :string
#  price       :decimal(12, 3)
#  active      :boolean
#

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
