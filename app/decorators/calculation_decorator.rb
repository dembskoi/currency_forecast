class CalculationDecorator < ApplicationDecorator
  decorates_association :currency

  delegate :code, to: :base_currency, prefix: true
  delegate :code, to: :target_currency, prefix: true

  def amount
    humanized_money_with_symbol Money.new(object.amount * 100, base_currency_code)
  end
end
