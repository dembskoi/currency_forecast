class Calculation < ApplicationRecord
  belongs_to :base_currency, class_name: 'Currency'
  belongs_to :target_currency, class_name: 'Currency'
  belongs_to :user

  validates :amount, :max_waiting_time, presence: true
  # Max PostgreSQL integer is 4 bytes	= 2147483647
  validates :amount, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 2_147_483_647 }
  validates :max_waiting_time,
            numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 250 }
  validate :currency_fields_are_not_equal

  private

  def currency_fields_are_not_equal
    return if base_currency_id != target_currency_id
    errors.add(:base, 'Base currency and Target currency cannot be equal')
  end
end
