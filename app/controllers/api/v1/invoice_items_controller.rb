class Api::V1::InvoiceItemsController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with InvoiceItem.all
  end

  def show
    respond_with InvoiceItem.find_by(id: params[:id])
  end

  def create
    respond_with InvoiceItem.create(invoice_item_params)
  end

  def update
    respond_with InvoiceItem.update(params[:id], invoice_item_params)
  end

  def destroy
    respond_with InvoiceItem.destroy(params[:id])
  end

  def random
    respond_with InvoiceItem.all.sample
  end

  def search
    respond_with InvoiceItem.find_by(params.first.first => params.first.last)
  end

  def search_all
    respond_with InvoiceItem.where(params.first.first => params.first.last)
  end
  private

  def invoice_item_params
    params.require(:item).permit(:item_id, :invoice_id, :unit_price, :quantity)
  end

end
