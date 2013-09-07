class CreateDefaultTags < ActiveRecord::Migration
  def change
    Tag.create :name => 'Groceries'
    Tag.create :name => 'Utilities'
    Tag.create :name => 'Mortgage'
    Tag.create :name => 'Kids'
    Tag.create :name => 'Clothes'
    Tag.create :name => 'Entertainment'
    Tag.create :name => 'Restaurants'
    Tag.create :name => 'Savings'
  end
end
