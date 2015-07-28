class Api::V1::InvoicesController < ApplicationController
  respond_to :json, :xml

  def index
    if params[:merchant_id]
      respond_with Invoice.where(merchant_id: params[:merchant_id])
    else
      respond_with Invoice.all
    end
  end

  def show
    respond_with Invoice.find_by(id: params[:id])
  end

  def create
    respond_with Invoice.create(invoice_params)
  end

  def update
    respond_with Invoice.update(params[:id], invoice_params)
  end

  def destroy
    respond_with Invoice.destroy(params[:id])
  end

  def random
    respond_with Invoice.all.sample
  end

  def search
    respond_with Invoice.find_by(params.first.first => params.first.last)
  end

  def search_all
    respond_with Invoice.where(params.first.first => params.first.last)
  end

  def customer
    respond_with Invoice.find_by(id: params[:invoice_id]).customer
  end

  def merchant
    respond_with Invoice.find_by(id: params[:invoice_id]).merchant
  end

  private

  def invoice_params
    params.require(:invoice).permit(:customer_id, :merchant_id, :status)
  end

end
