class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  validates :name, :image, :text, presence: true
  mount_uploader :image, ImageUploader

  def self.search(search)
    if search
      Post.where('text LIKE(?)', "%#{search}%")
    else
      Post.all
    end
  end
end
