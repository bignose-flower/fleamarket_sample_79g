class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :nickname
    validates :password
    validates :birthday
    validates :hurigana_first
    validates :hurigana_family
    validates :first_name
    validates :family_name
  end
  with_options format: {with: /\A[ぁ-んー－]+\z/, message: "は全角ひらがなで入力してください"} do
    validates :hurigana_first, allow_blank: true
    validates :hurigana_family, allow_blank: true
  end
  
  with_options format: {with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/, message: "は全角で入力してください"} do
    validates :first_name, allow_blank: true
    validates :family_name, allow_blank: true
  end

  has_one :account
  has_one :address
end
