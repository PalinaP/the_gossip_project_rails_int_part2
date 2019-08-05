class User < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  has_many :posted_gossips, foreign_key: 'author_id', class_name: 'Gossip', dependent: :destroy
end
