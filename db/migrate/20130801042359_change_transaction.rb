class ChangeTransaction < ActiveRecord::Migration
  def change
    add_column :transactions, :tag_id, :int

    add_index :transactions, :tag_id
  end
end
