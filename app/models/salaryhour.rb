class Salaryhour < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :hours, presence: true
  validates :money, presence: true
end
