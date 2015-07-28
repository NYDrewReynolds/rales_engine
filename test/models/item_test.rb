require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  test "can create an Item" do
    item = Item.new(name: "Hot Dog", description: "Delicious.", unit_price: 5, merchant_id: 1)
    assert item.save
  end

  test "item is invalid without name, description, price, or merchant" do
    item = Item.new
    assert_not item.save
  end

  test "item is invalid without name" do
    item = Item.new(description: "Delicious.", unit_price: 5, merchant_id: 1)
    assert_not item.save
  end

  test "item is invalid without description" do
    item = Item.new(name: "Hot Dog", unit_price: 5, merchant_id: 1)
    assert_not item.save
  end

  test "item is invalid without price" do
    item = Item.new(name: "Hot Dog", description: "Delicious.", merchant_id: 1)
    assert_not item.save
  end

  test "item is invalid without merchant_id" do
    item = Item.new(name: "Hot Dog", description: "Delicious.", unit_price: 5)
    assert_not item.save
  end
end
