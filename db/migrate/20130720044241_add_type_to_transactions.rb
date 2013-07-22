class AddTypeToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :type, :string, :before => :trans_date
  end
end
