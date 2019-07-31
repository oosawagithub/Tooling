class Comment < ApplicationRecord

	belongs_to :post

    validates :name, presence: true
    validates :name, length: {maximum: 20}

    validates :body, presence: true
    validates :body,  length: { maximum: 150 }

end
