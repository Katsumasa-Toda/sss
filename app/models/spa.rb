class Spa < ApplicationRecord
  belongs_to :user
  has_many :spa_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user

  def favoreted_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  validates :name, presence: true
  validates :address, presence: true
  validates :introduction, presence: true
  validates :introduction, length: { maximum: 200 }
  validates :bath, presence: true
  validates :parking, presence: true
  validates :opening, presence: true
end
