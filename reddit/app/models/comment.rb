class Comments < ApplicationRecord
    validates :content, :author_id, :post_id, presence: true

    belongs_to :post,
        primary_key: :id,
        foreign_key: :post_id,
        class_name: :Post

    belongs_to :author,
        primary_key: :id,
        foreign_key: :author_id,
        class_name: :User
end