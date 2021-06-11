class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_cost
  belongs_to :shipping_area
  belongs_to :shipping_day
  has_one :purchase_management
  has_one_attached :image 

  with_options presence: true do
      validates :name, length: { maximum: 40 }
      validates :description,  length: { maximum: 1000 } 
      validates :price, format: { with: /\A[0-9]+\z/ }, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
      validates :image
    with_options numericality: { other_than: 0 } do
      validates :category_id
      validates :status_id
      validates :shipping_cost_id
      validates :shipping_area_id
      validates :shipping_day_id
    end
  end
end
