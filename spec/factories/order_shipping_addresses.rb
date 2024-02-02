FactoryBot.define do
  factory :order_shipping_address do
    item_id { FactoryBot.build(:item) }
    user_id { FactoryBot.build(:user) }
    postal_code { '123-4567' }
    prefecture_id { Prefecture.all.sample }
    city { '横浜市' }
    address { '1-1' }
    building { 'ハイツ' }
    phone_number { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
