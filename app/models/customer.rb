class Customer < ActiveRecord::Base
  has_many :invoices
  has_many :merchants, through: :invoices

  validates :first_name, presence: true
  validates :last_name, presence: true

  def favorite_merchant
    Merchant.find(successful.favorite_merchant)
  end

  def successful
    invoices.successful
  end
end
