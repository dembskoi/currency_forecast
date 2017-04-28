class ResultDecorator < ApplicationDecorator
  def exchange_sum
    humanized_money_with_symbol Money.new(object.exchange_sum * 100, target_currency_code)
  end
end
