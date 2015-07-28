class Api::V1::CustomersController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with Customer.all
  end

  def show
    respond_with Customer.find_by(id: params[:id])
  end

  def create
    respond_with Customer.create(customer_params)
  end

  def update
    respond_with Customer.update(params[:id], customer_params)
  end

  def destroy
    respond_with Customer.destroy(params[:id])
  end

  def random
    respond_with Customer.all.sample
  end

  def search
    respond_with Customer.find_by(params.first.first => params.first.last)
  end

  def search_all
    respond_with Customer.where(params.first.first => params.first.last)
  end

  def invoices
    respond_with Invoice.where(customer_id: params[:customer_id])
  end

  def transactions
    respond_with Customer.find_by(id: params[:customer_id]).invoices.flat_map { |invoice| invoice.transactions }
  end

  def favorite_merchant
    respond_with Customer.find_by(id: params[:id]).favorite_merchant
  end
  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name)
  end
end
