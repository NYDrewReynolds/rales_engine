require 'test_helper'

class Api::V1::MerchantsControllerTest < ActionController::TestCase

  test "find returns merchant by id" do
    merchant = Merchant.create(name:"Pied Piper")

    get :find, format: :json, id: merchant.id

    merchant_response = JSON.parse(response.body)

    assert_equal merchant.id, merchant_response["id"]
    assert_equal "Pied Piper", merchant_response["name"]

  end

  test "find returns merchant by name" do
    merchant = Merchant.create(name: "Pied Piper")

    get :find, format: :json, name: merchant.name

    merchant_response = JSON.parse(response.body)

    assert_equal merchant.id, merchant_response["id"]
    assert_equal "Pied Piper", merchant_response["name"]

  end

  test "find_all returns merchant by name" do
    merchant_one = Merchant.create(name: "Pied Piper")
    merchant_two = Merchant.create(name: "Pied Piper")

    get :find_all, format: :json, name: merchant_one.name

    merchant_response = JSON.parse(response.body)

    assert_equal 2, merchant_response.count
  end

  # test "delete merchant by name" do
  #   merchant = Merchant.create(name: "Pied Piper")
  #
  #   expect {
  #     delete :destroy, id: merchant.id, format: :json
  #   }.to change { Merchant.count }.from(1).to(0)
  #
  #   expect(response).to have_http_status(:no_content)
  # end
end
