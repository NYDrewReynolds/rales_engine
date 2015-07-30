require 'csv'

namespace :csv do
  desc "parse csv file to get AR data"

  task customers: :environment do
    csv_text = File.read('./lib/assets/csv/customers.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      Customer.create(row.to_h.except("id"))
    end
  end

  task merchants: :environment do
    csv_text = File.read('./lib/assets/csv/merchants.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      Merchant.create(row.to_h.except("id"))
    end
  end

  task items: :environment do
    csv_text = File.read('./lib/assets/csv/items.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      Item.create(row.to_h.except("id"))
    end
  end

  task invoices: :environment do
    csv_text = File.read('./lib/assets/csv/invoices.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      Invoice.create(row.to_h.except("id"))
    end
  end

  task invoice_items: :environment do
    csv_text = File.read('./lib/assets/csv/invoice_items.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      InvoiceItem.create(row.to_h.except("id"))
    end
  end

  task transactions: :environment do
    csv_text = File.read('./lib/assets/csv/transactions.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      Transaction.create(row.to_h.except("id", "credit_card_expiration_date"))
    end
  end

  task all: :environment do
    `rake csv:customers && rake csv:merchants && rake csv:items && rake csv:invoices && rake csv:invoice_items && rake csv:transactions`
  end
end
