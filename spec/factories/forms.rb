FactoryBot.define do
  factory :form do
    post_code               {"123-4567"}
    shipping_area_id        {1}
    city                    {"横浜市南区"}
    address                 {"青山1-1-1"}
    phone_number            {"09012345678"}
    user_id                 {1}
    item_id                 {1}
    token                   {"tok_abcdefghijk00000000000000000"}
  end
end
