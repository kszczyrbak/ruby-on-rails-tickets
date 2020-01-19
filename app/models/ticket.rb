class Ticket < ApplicationRecord
  validates :name, :presence => true, :length => { :minimum => 6 }
  validates :email_address, :presence => true
  validates :price, :presence => true

  belongs_to :event
  accepts_nested_attributes_for :event

  belongs_to :user
end
