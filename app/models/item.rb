class Item < ApplicationRecord
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
    uniqueness: true,
    length: { minimum:3, maximum:20 } )
  validates(
    :price,
    numericality: true,
    presence: true )




end
