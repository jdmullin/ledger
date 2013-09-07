class TransactionsController < ApplicationController

  def index
    @transactions = Transaction.all
  end

  def create
    Transaction.import(params[:file])
    redirect_to transactions_url, notice: "Transactions imported."
  end

  def clear_all
    Transaction.destroy_all
    redirect_to transactions_url, notice: "Transactions cleared."
  end

  def set_tag
    transaction = Transaction.find(params[:id])
    transaction.tag = Tag.find(params[:tag_id])
    # unresolved jmu - test save result at some point and return error if save fails
    transaction.save

    render :nothing => true
  end
end
