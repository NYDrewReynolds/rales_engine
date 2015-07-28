class Invoice < ActiveRecord::Base
  belongs_to :customer
  belongs_to :merchant
  has_many :invoice_items
  has_many :transactions
  has_many :items, through: :invoice_items

  validates :merchant_id, presence: true
  validates :customer_id, presence: true
  validates :status, presence: true

  def self.successful
    joins(:transactions).where(:transactions => {result:"success"})
  end

  def self.unsuccessful
    all - successful
  end

  def self.favorite_customer
    joins(:customer).group(:customer_id).count.sort_by { |id, count| count }.reverse.first[0]
  end

  def self.favorite_merchant
    joins(:merchant).group(:merchant_id).count.sort_by { |id, count| count }.reverse.first[0]
  end

end
