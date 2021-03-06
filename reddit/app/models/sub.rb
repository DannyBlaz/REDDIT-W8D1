class Sub < ApplicationRecord
    validates :title, :description, :moderator_id, presence: true
    validates :title, uniqueness: {scope: :moderator_id, message: "Duplicate title"}


    belongs_to :moderator,
        primary_key: :id,
        foreign_key: :moderator_id,
        class_name: :User

    has_many :posts,
        primary_key: :id,
        foreign_key: :sub_id,
        class_name: :Post

end