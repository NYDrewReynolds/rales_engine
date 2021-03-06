class Api::V1::TransactionsController < ApplicationController
  respond_to :json, :xml

  def index
    if params[:invoice_id]
      respond_with Transaction.where(invoice_id: params[:invoice_id])
    else
    respond_with Transaction.all
    end
  end

  def show
    respond_with Transaction.find_by(id: params[:id])
  end

  def create
    respond_with Transaction.create(transaction_params)
  end

  def update
    respond_with Transaction.update(params[:id], transaction_params)
  end

  def destroy
    respond_with Transaction.destroy(params[:id])
  end

  def random
    respond_with Transaction.all.sample
  end

  def find
    respond_with Transaction.find_by(params.first.first => params.first.last)
  end

  def find_all
    respond_with Transaction.where(params.first.first => params.first.last)
  end

  def invoice
    respond_with Transaction.find_by(id: params[:transaction_id]).invoice
  end

  private

  def transaction_params
    params.require(:transaction).permit(:invoice_id, :credit_card_number, :result)
  end

end
