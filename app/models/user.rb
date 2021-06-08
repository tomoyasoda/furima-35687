class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :items

  with_options presence: true do
    validates :nickname
    validates :first_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' }
    validates :last_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' }           
    validates :first_kana_name, format: {with: /\A[ァ-ヶー]+\z/, message: "全角カタカナを使用してください"}
    validates :last_kana_name,  format: {with: /\A[ァ-ヶー]+\z/, message: "全角カタカナを使用してください"}
    validates :birthday

    validates :password, length: { minimum: 6 }, format: { with: /\A[a-z0-9]+\z/i, message: "英数字文字6以上"}

  end
end

