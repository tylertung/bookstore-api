class AddQuantityToRates < ActiveRecord::Migration[6.1]
  def change
    add_column :rates, :quantity, :integer
  end
end
