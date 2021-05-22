class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_cost
  belongs_to :shipping_area
  belongs_to :shipping_day
  belongs_to :user, optional: true
  has_one :purchase_management
  has_one_attached :image 

  with_options presence: true do
    validates :name, length: { maximum: 40 }
    validates :description,  length: { maximum: 1000 } 
    validates :price, format: { with: /\A[0-9]+\z/ }, numericality: { greater_than_or_equal_to: 300,less_than: 999_999_999 }
    validates :category_id, numericality: { other_than: 0 }
    validates :status_id, numericality: { other_than: 0 }
    validates :shipping_cost_id, numericality: { other_than: 0 }
    validates :shipping_area_id, numericality: { other_than: 0 }
    validates :shipping_day_id, numericality: { other_than: 0 }
    validates :image
  end

end
