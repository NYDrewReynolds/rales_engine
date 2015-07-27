require 'csv'

namespace :csv do
  desc "parse csv file to get AR data"

  task customers: :environment do
    csv_text = File.read('./lib/assets/csv/customers.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      Customer.create(row.to_h)
    end
  end

  task merchants: :environment do
    csv_text = File.read('./lib/assets/csv/merchants.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      Merchant.create(row.to_h)
    end
  end

  task items: :environment do
    csv_text = File.read('./lib/assets/csv/items.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      Item.create(row.to_h)
    end
  end

  task invoices: :environment do
    csv_text = File.read('./lib/assets/csv/invoices.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      Invoice.create(row.to_h)
    end
  end

  task invoice_items: :environment do
    csv_text = File.read('./lib/assets/csv/invoice_items.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      InvoiceItem.create(row.to_h)
    end
  end

  task transactions: :environment do
    csv_text = File.read('./lib/assets/csv/transactions.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      Transaction.create(row.to_h)
    end
  end
end
