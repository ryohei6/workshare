class Post < ApplicationRecord
    belongs_to :user
    attachment :image
    has_many :details, dependent: :destroy

    with_options presence: true do
        validates :title
        validates :body
        validates :price, numericality:{only_integer: true}
    end

    def self.search(search)
        if search
            Post.where(['title LIKE ?', "%#{search}%"])
        else
            Post.all
        end
    end
end
