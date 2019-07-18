class Comment < ApplicationRecord

	belongs_to :post

    # validates :name, presence: true
    # validates :name, length: {maximum: 20}

    # validates :body, presence: true
    # validates :body,  length: { maximum: 150 }

    validate :add_error

  def add_error
    if name.blank?
        errors[:base] << "名前を入力してください"
    elsif name.length > 20
        error[:base] << "名前は20文字までで入力してください"
    end

    if body.blank?
        errors[:base] << "本文を入力してください"
    elsif body.length > 150
        error[:base] << "本文は150文字までで入力してください"
    end
  end

end
