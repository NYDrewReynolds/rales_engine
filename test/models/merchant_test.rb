require 'test_helper'

class MerchantTest < ActiveSupport::TestCase
  test "can create a Merchant" do
    merchant = Merchant.new(name:"Pied Piper")
    assert merchant.save
  end

  test "merchant is invalid without name" do
    merchant = Merchant.new
    assert_not merchant.save
  end
end
