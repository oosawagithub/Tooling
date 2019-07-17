class Post < ApplicationRecord

	has_many :comments, dependent: :destroy

	# 親に対し、optional: trueが必要
	belongs_to :category, optional: true

	#attachment :post_image
    has_many :post_images, dependent: :destroy
    accepts_attachments_for :post_images, attachment: :image

    #PV数カウント
    is_impressionable counter_cache: true

	enum location: {
    北海道:1,青森県:2,岩手県:3,宮城県:4,秋田県:5,山形県:6,福島県:7,
    茨城県:8,栃木県:9,群馬県:10,埼玉県:11,千葉県:12,東京都:13,神奈川県:14,
    新潟県:15,富山県:16,石川県:17,福井県:18,山梨県:19,長野県:20,
    岐阜県:21,静岡県:22,愛知県:23,三重県:24,
    滋賀県:25,京都府:26,大阪府:27,兵庫県:28,奈良県:29,和歌山県:30,
    鳥取県:31,島根県:32,岡山県:33,広島県:34,山口県:35,
    徳島県:36,香川県:37,愛媛県:38,高知県:39,
    福岡県:40,佐賀県:41,長崎県:42,熊本県:43,大分県:44,宮崎県:45,鹿児島県:46,沖縄県:47
  }

    # validates :name, presence: true
    # validates :name, length: {maximum: 20}

    # validates :title, presence: true
    # validates :title, length: {maximum: 20}

    # validates :body, presence: true
    # validates :body,  length: { maximum: 300 }

    # validates :location, presence: true

    # validates :category, presence: true

    validate :add_error

  def add_error
    if name.blank?
        errors[:base] << "名前を入力してください"
    elsif name.length > 20
        error[:base] << "名前は20文字までで入力してください"
    end

    if title.blank?
        errors[:base] << "タイトルを入力してください"
    elsif title.length > 20
        error[:base] << "タイトルは20文字までで入力してください"
    end

    if body.blank?
        errors[:base] << "本文を入力してください"
    elsif body.length > 300
        error[:base] << "本文は300文字までで入力してください"
    end

    # 都道府県が空のときにエラーメッセージを追加する
    if location.blank?
      errors[:base] << "都道府県を選択してください"
    end

    # カテゴリーが空のときにエラーメッセージを追加する
    if category.blank?
      errors[:base] << "カテゴリーを選択してください"
    end
  end

end
