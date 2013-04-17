require 'spec_helper'

describe Order do
  include_context "standard test dataset"
  let!(:new_user){FactoryGirl.build(:user)}
  let!(:order){Order.create(status: "pending", user_id: 1, total_cost: 3372, card_number: '4242424242424242')}
  let(:store){FactoryGirl.create(:store)}
  let!(:li){LineItem.create(product_id: 1, cart_id: nil,
  order_id: 1, quantity: 3, price: 24)}

  describe 'add_line_items' do
    it "adds order id to each line_item in a cart at checkout" do
      cart = Cart.create
      order.add_line_items(cart)
      order.line_items
    end
  end

  describe "generate random" do
    it "generates random thing" do
      a = order.generate_confirmation_code
      (order.generate_confirmation_code).should_not eq a
    end
  end

  describe "store id with an order" do 

    it "order is associated with a particular store" do 
      order.store_id = store.id
      expect(order.store_id).to_not be_nil
    end
  end 
end
