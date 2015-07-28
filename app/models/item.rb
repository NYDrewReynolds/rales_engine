class Item < ActiveRecord::Base
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  validates :name, presence: true
  validates :description, presence: true
  validates :unit_price, presence: true
  validates :merchant_id, presence: true

  def self.most_revenue(quantity)
    all.sort_by { |item| item.total_revenue }.last(quantity).reverse
  end

  def total_revenue
    successful.joins(:invoice_items).sum('"invoice_items"."quantity" * "invoice_items"."unit_price"')
  end

  def successful
    invoices.successful
  end
end
