class Api::V1::ItemsController < ApplicationController
  respond_to :json, :xml

  def index
    if params[:merchant_id]
      respond_with Item.where(merchant_id: params[:merchant_id])
    elsif params[:invoice_id]
      respond_with Item.where(invoice_id: params[:invoice_id])
    else
      respond_with Item.all
    end
  end

  def show
    respond_with Item.find_by(id: params[:id])
  end

  def create
    respond_with Item.create(item_params)
  end

  def update
    respond_with Item.update(params[:id], item_params)
  end

  def destroy
    respond_with Item.destroy(params[:id])
  end

  def random
    respond_with Item.all.sample
  end

  def search
    respond_with Item.find_by(params.first.first => params.first.last)
  end

  def search_all
    respond_with Item.where(params.first.first => params.first.last)
  end

  def merchant
    respond_with Item.find_by(id: params[:item_id]).merchant
  end

  def most_revenue
    respond_with Item.most_revenue(params[:quantity].to_i)
  end

  def most_items
    respond_with Item.most_items(params[:quantity].to_i)
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :unit_price, :merchant_id)
  end

end
