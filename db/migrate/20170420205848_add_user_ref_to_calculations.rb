class AddUserRefToCalculations < ActiveRecord::Migration[5.0]
  def change
    add_reference :calculations, :user, index: true, foreign_key: true
  end
end
