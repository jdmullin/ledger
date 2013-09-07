class AddMoreTags3 < ActiveRecord::Migration
  def change
    Tag.create :name => 'Paycheck'
    Tag.create :name => 'Bank Fees'
  end
end
