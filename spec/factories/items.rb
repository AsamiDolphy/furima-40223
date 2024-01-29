FactoryBot.define do
  factory :item do
    association :user
    name { Faker::Lorem.sentence }
    info { Faker::Lorem.sentence }
    category { Category.all.sample }
    item_status { ItemStatus.all.sample }
    shipping_fee { ShippingFee.all.sample }
    prefecture { Prefecture.all.sample }
    scheduled_delivery { ScheduledDelivery.all.sample }
    # { Faker::Number.between(from: 1, to: 3) }
    price { Faker::Number.between(from: 300, to: 9_999_999) }

    after(:build) do |message|
      message.image.attach(io: File.open('app/assets/images/item-sample.png'), filename: 'item-sample.png')
    end
  end
end
