# require 'csv'
#
# namespace :csv do
#   desc "parse csv file to get customers"
#   task customers: :environment do
#     csv_text = File.read('./lib/assets/csv/customers.csv')
#     csv = CSV.parse(csv_text, :headers => true)
#     csv.each do |row
#       Customer.create(row.to_h)
#     end
#   end
#
#   desc "parse csv file to get merchants"
#   task merchants: :environment do
#     csv_text = File.read ('./lib/assets/csv/merchants.csv')
#     csv = CSV.parse (csv_text, :headers => true)
#     csv.each do |row
#       Merchant.create(row.to_h)
#     end
#   end
#
#   desc "parse csv file to get invoices"
#   task invoices: :environment do
#     csv_text = File.read('./lib/assets/csv/invoices.csv')
#     csv = CSV.parse(csv_text, :headers => true)
#     csv.each do |row
#       Customer.create (row.to_h)
#     end
#   end
#
# end
