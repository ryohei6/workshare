class Detail < ApplicationRecord
    belongs_to :user, optional: true
    belongs_to :post, optional: true

    with_options presence: true do
        validates :comment
    end
end
