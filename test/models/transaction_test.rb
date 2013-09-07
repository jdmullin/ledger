require 'test_helper'

class TransactionTest < ActiveSupport::TestCase
  test "tags" do
    t = Transaction.first
    tag = Tag.find_by name: "Groceries"
    t.tag = tag
    saveResult = t.save
    assert saveResult

    t = Transaction.first
    assert_equal "Groceries", t.tag.name
  end

  test "import duplicates" do
    file = File.new("#{Rails.root}/test/fixtures/importTest.csv", "r")
    Transaction.import(file)

    descriptions = Transaction.group(:description).count
    assert descriptions['WALGREENS #1221'] == 1

    # import again, which should discard duplicates and we still just have 1 Walgreens entry
    Transaction.import(file)
    descriptions = Transaction.group(:description).count
    assert descriptions['WALGREENS #1221'] == 1
  end

  test "import wells fargo format" do
    file = File.new("#{Rails.root}/test/fixtures/checking.csv", "r")
    Transaction.import(file)

    row = Transaction.find_by description: 'CHECK # 2718'
    assert row.amount == -40

    # wells fargo has input date format of 08/21/2013
    assert row.post_date.to_s == '2013-08-21'
  end

  test "import chase format" do
    file = File.new("#{Rails.root}/test/fixtures/chase.csv", "r")
    Transaction.import(file)

    row = Transaction.find_by description: 'FRED MEYER #0685'
    assert row.amount == -54

    # chase has a weird date format we have to handle, input file has 8/31/13 which should be imported as Aug 31st, 2013
    assert row.trans_date.to_s == '2013-08-31'
  end
end
