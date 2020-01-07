class Event < ApplicationRecord
  validates :artist, :presence => true
  validates :price_low, :presence => true, numericality: { only_integer: true }
  validates :price_high, :presence => true, numericality: { only_integer: true }
  validates :event_date, :presence => true

  has_many :tickets

  def event_date_not_from_past
    if event_date < Date.today
      errors.add("Event date", "cannot be from the past")
    end
  end

  def max_value_higher_than_min
    if price_high < price_low
      errors.add("Price low", "cannot be higher than price high")
    end
  end
end
