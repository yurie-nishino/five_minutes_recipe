class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy #postが削除されたら一緒に削除
  validates :name, :image, :text, presence: true
  mount_uploader :image, ImageUploader

  def like_user(user_id)
    likes.find_by(user_id: user_id)#そのユーザーが持っているlikeを探す
  end

  def self.search(search)
    if search
      Post.where('text LIKE(?)', "%#{search}%")
    else
      Post.all
    end
  end
end
