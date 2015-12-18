class Bathroom < ActiveRecord::Base
  validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true
  validates :zip, length: {is: 5}
  validates :zip, numericality: { only_integer: true}
end