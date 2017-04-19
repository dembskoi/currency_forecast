class CalculationDecorator < ApplicationDecorator
  decorates_association :currency

  delegate :code, to: :base_currency, prefix: true
  delegate :code, to: :target_currency, prefix: true
end
