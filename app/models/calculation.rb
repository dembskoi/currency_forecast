class Calculation < ApplicationRecord
  belongs_to :base_currency, class_name: 'Currency'
  belongs_to :target_currency, class_name: 'Currency'

  # Max PostgreSQL integer is 4 bytes	= 2147483647
  validates :amount, presence: true,
            numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 2147483647 }
end
