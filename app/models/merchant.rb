class Merchant < ActiveRecord::Base
  has_many :invoices
  has_many :items
  has_many :customers, through: :invoices

  validates :name, presence: true

  def self.most_revenue(quantity)
    all.sort_by{ |merchant| merchant.total_revenue }.last(quantity).reverse
  end

  def total_revenue
    successful.joins(:invoice_items).sum("quantity * unit_price")
  end

  def self.most_items(quantity)
    all.sort_by { |merchant| merchant.total_items }.last(quantity).reverse
  end

  def total_items
    successful.joins(:invoice_items).sum(:quantity)
  end

  def self.revenue_by_date(date)
    all.map
  end

  def total_revenue_by_date(date)
    successful.where(created_at: date).joins(:invoice_items).sum("quantity * unit_price")
  end

  def favorite_customer
    Customer.find(successful.favorite_customer)
  end

  def customers_with_pending_invoices
    failed.map { |invoice| invoice.customer}
  end

  private

  def successful
    invoices.successful
  end

  def failed
    invoices.unsuccessful
  end

end
