class AddCheckNumberToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :check_number, :string
  end
end
