FactoryBot.define do
  factory :item do
    name               {"aaaa"}
    description        {"これは説明です。"}
    category_id        {1}
    status_id          {1}
    shipping_cost_id   {1}
    shipping_area_id   {13}
    shipping_day_id    {1}
    price              {9999}
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/comment.png'), filename: 'comment.png')
    end
  
  end
end
