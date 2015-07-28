require 'test_helper'

class InvoiceItemTest < ActiveSupport::TestCase
  test "can create an Invoice Item" do
    ii = InvoiceItem.new(item_id: 10, invoice_id: 22, unit_price: 4, quantity: 10)
    assert ii.save
  end

  test "Invoice Item is invalid without item, invoice, price, or quantity" do
    ii = InvoiceItem.new
    assert_not ii.save
  end

  test "Invoice Item is invalid without item_id" do
    ii = InvoiceItem.new(invoice_id: 22, unit_price: 4, quantity: 10)
    assert_not ii.save
  end

  test "Invoice Item is invalid without invoice_id" do
    ii = InvoiceItem.new(item_id: 10, unit_price: 4, quantity: 10)
    assert_not ii.save
  end

  test "Invoice Item is invalid without price" do
    ii = InvoiceItem.new(item_id: 10, invoice_id: 22, quantity: 10)
    assert_not ii.save
  end

  test "Invoice Item is invalid without quantity" do
    ii = InvoiceItem.new(item_id: 10, invoice_id: 22, unit_price: 4)
    assert_not ii.save
  end
end
