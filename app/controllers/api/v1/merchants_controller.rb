class Api::V1::MerchantsController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with Merchant.all
  end

  def show
    respond_with Merchant.find_by(id: params[:id])
  end

  def create
    respond_with Merchant.create(merchant_params)
  end

  def update
    respond_with Merchant.update(params[:id], merchant_params)
  end

  def destroy
    respond_with Merchant.destroy(params[:id])
  end

  def random
    respond_with Merchant.all.sample
  end

  def search
    respond_with Merchant.find_by(params.first.first => params.first.last)
  end

  def search_all
    respond_with Merchant.where(params.first.first => params.first.last)
  end

  private

  def merchant_params
    params.require(:merchant).permit(:name)
  end

end
