class CreateCurrencyRates < ActiveRecord::Migration[5.0]
  def change
    enable_extension 'hstore' unless extension_enabled?('hstore')
    create_table :currency_rates do |t|
      t.references :base_currency, foreign_key: { to_table: :currencies }
      t.integer :year
      t.integer :week

      t.hstore :rates
      t.timestamps
    end
    add_index :currency_rates, %i[base_currency_id year week], unique: true
  end
end
