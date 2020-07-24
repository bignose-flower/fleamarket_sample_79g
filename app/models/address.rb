class Address < ApplicationRecord
  with_options presence: true do
    validates :address
    validates :city
    validates :prefecture 
    validates :zipcode
    validates :shipping_hurigana_first
    validates :shipping_hurigana_family
    validates :shipping_first_name
    validates :shipping_family_name
  end

  with_options format: {with: /\A\d{7}\z/, message: "は-(ハイフン)無しで入力してください"} do
    validates :zipcode, allow_blank: true
  end

  with_options format: {with: /\A[ぁ-んー－]+\z/, message: "は全角ひらがなで入力してください"} do
    validates :shipping_hurigana_first, allow_blank: true
    validates :shipping_hurigana_family, allow_blank: true
  end

  with_options format: {with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/, message: "は全角で入力してください"} do
    validates :shipping_first_name, allow_blank: true
    validates :shipping_family_name, allow_blank: true
  end

  validates :phone_number, format: {with: /\A\d{10,11}\z/, message: "は-(ハイフン)無しで入力してください"}, allow_blank: true

  belongs_to :user, optional: true
end
