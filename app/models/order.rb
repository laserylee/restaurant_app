class Order < ApplicationRecord
  validate :enough_time
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates(
    :item_list,
    presence: true,
    format: { with: /\A[a-zA-Z\d]+\s*([a-zA-Z\d\s])+\z/ } )
  validates(
    :item_quantity,
    presence: true,
    format: { with: /\A[\d]+\s*[\d\s]*\z/ } )
  validates(
    :pickup_time,
    presence: true )
  validates(
    :price,
    presence: true,
    numericality: true )
  validates(
    :user_id,
    presence: true )

  def enough_time
    if pickup_time.present? && pickup_time < ( Time.zone.now + 1.hours )
      errors.add(:pickup_time, "Should at least 1 hours before pick-up time")
    end
  end
end
