class Calculation < ApplicationRecord
  belongs_to :base_currency, class_name: 'Currency'
  belongs_to :target_currency, class_name: 'Currency'
end
