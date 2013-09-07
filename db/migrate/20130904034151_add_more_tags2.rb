class AddMoreTags2 < ActiveRecord::Migration
  def change
    Tag.create :name => 'Gifts Given'
    Tag.create :name => 'Gym Fees'
    Tag.create :name => 'Unknown'
  end
end
