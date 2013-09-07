class AddSignatureToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :signature, :string, :before => :trans_date
    add_index :transactions, :signature
  end
end
