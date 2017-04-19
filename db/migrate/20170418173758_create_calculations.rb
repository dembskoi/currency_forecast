class CreateCalculations < ActiveRecord::Migration[5.0]
  def change
    create_table :calculations do |t|
      t.references :base_currency, foreign_key: { to_table: :currencies }
      t.references :target_currency, foreign_key: { to_table: :currencies }
      t.integer :amount
      t.integer :max_waiting_time

      t.timestamps
    end
  end
end
