class Post < ApplicationRecord
    belongs_to :user
    attachment :image
    has_many :details, dependent: :destroy

    with_options presence: true do
        validates :title
        validates :body
        validates :price
    end

    def self.search(search)
        return Post.all unless search
        Post.where(['title LIKE ?', "%#{search}%"])
      end
end
