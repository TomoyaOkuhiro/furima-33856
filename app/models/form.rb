class Form
  include ActiveModel::Model
  attr_accessor :purchase_management, :post_code, :phone_number, :shipping_area_id, :city, :address, :building_name, :user_id, :item_id, :token

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone_number, format: {with: /\A\d{10,11}\z/}
    validates :shipping_area_id, numericality: { other_than: 0 }
    validates :city
    validates :address
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    # 各テーブルにデータを保存する処理を書く
    sell = PurchaseManagement.create(user_id: user_id, item_id: item_id)
    Address.create(purchase_management: purchase_management, post_code: post_code, phone_number: phone_number, shipping_area_id: shipping_area_id, city: city, address: address, building_name: building_name, purchase_management_id: sell.id)
  end
end