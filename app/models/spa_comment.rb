class SpaComment < ApplicationRecord
  belongs_to :user
  belongs_to :spa
  validates :comment, presence: true
end
