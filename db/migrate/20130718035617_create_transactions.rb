class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.date :trans_date
      t.date :post_date
      t.string :description
      t.decimal :amount

      t.timestamps
    end
  end
end
