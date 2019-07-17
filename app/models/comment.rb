class Comment < ApplicationRecord

	belongs_to :post

    validates :name, presence: true
    validates :name, length: {maximum: 20}
    validates :name, length: {minimum: 2}

    validates :body, presence: true
    validates :body,  length: { maximum: 50 }


end
