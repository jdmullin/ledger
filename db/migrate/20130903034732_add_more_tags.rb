class AddMoreTags < ActiveRecord::Migration
  def change
    Tag.create :name => 'Household'
    Tag.create :name => 'Auto'
    Tag.create :name => 'Recreation'
    Tag.create :name => 'Dogs'
    Tag.create :name => 'Medical'
    Tag.create :name => 'Credit Card Payment'
  end
end
