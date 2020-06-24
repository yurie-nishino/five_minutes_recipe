class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post, cocunter_cache: :likes_count
  validates :user_id, uniqueness: { scope: :post_id }
end
