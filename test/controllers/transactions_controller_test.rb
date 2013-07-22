require 'test_helper'

class TransactionsControllerTest < ActionController::TestCase
  test "import" do
    filename = Rails.root.join("test/fixtures/importTest.csv")
    file = Rack::Test::UploadedFile.new(filename, "image/jpeg")

    post :create, file: file
    assert_response 302  # redirected

    get :index
    assert_response :success
    transactions = assigns(:transactions)
    row = transactions.find_by description: 'WALGREENS #1221'
    assert_equal -10, row.amount
    assert_equal 'Sat, 15 Jun 2013'.to_date, row.trans_date
  end
end
