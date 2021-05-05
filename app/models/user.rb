class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, uniqueness: true
  validates :password, presence: { message: 'Password Include both letters and numbers' }, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, length: { minimum: 6 }}
  with_options presence: true do
   validates :nickname
   validates :last_name, format: {with: /\A[ぁ-んァ-ン一-龥々]/ }
   validates :first_name, format: {with: /\A[ぁ-んァ-ン一-龥々]/ }
   validates :last_name_kana, format: {with: /\A[ァ-ヶー－]+\z/ }
   validates :first_name_kana, format: {with: /\A[ァ-ヶー－]+\z/ }
   validates :birth_day
  end

  has_many :items
  has_many :purchase_managements
end
