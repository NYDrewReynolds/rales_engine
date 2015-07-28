require 'test_helper'

class InvoiceTest < ActiveSupport::TestCase
  test "can create an Invoice" do
    invoice = Invoice.new(merchant_id: 5, customer_id: 1000, status: "completed")
    assert invoice.save
  end

  test "invoice is invalid without merchant. customer, or status" do
    invoice = Invoice.new
    assert_not invoice.save
  end

  test "invoice is invalid without merchant" do
    invoice = Invoice.new(customer_id: 1000, status: "completed")
    assert_not invoice.save
  end

  test "invoice is invalid without customer" do
    invoice = Invoice.new(merchant_id: 5, status: "completed")
    assert_not invoice.save
  end

  test "invoice is invalid without status" do
    invoice = Invoice.new(merchant_id: 5, customer_id: 55)
    assert_not invoice.save
  end
end
