class TransactionsController < ApplicationController

  def index
    @transactions = Transaction.all
  end

  def create
    Transaction.import(params[:file])
    redirect_to transactions_url, notice: "Transactions imported."
  end

end
