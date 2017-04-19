class Currency < ApplicationRecord
  validates :code, presence: true, uniqueness: true

  after_commit :clear_cache

  def self.codes_by_id
    Rails.cache.fetch('currency_codes_by_id') do
      pluck(:code, :id)
    end
  end

  private

  def clear_cache
    Rails.cache.delete('currency_codes_by_id')
  end
end
