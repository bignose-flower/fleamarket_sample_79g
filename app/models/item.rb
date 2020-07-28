class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :description
    validates :price
    validates :item_status
    validates :owner_area
    validates :shipping_date
  end
  #image紐付け先のバリデーション
  validates_associated :images
  validates :images, presence: { message: 'は１枚以上添付してください'} 
  #ここまでimageのバリデーション

  has_many :images
  accepts_nested_attributes_for :images, allow_destroy: true

  #選択肢作成
  enum status: {
    "新品": 0,
    "未使用に近い": 1,
    "目立った傷等はない": 2,
    "軽い傷がある": 3,
    "汚れが多い": 4,
    "かなり汚れている": 5,
  }
  enum shipping: {
    "1~2日": 0,
    "2~3日": 1,
    "3~4日": 2,
    "4~5日": 3,
    "一週間以上": 4,
  }
  enum shipping_fee: {
    "送料込み(出品者負担)": 0,
    "着払い(購入者負担)": 1
  }
end
