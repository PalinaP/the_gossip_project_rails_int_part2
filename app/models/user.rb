class User < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates:email, presence:true, uniqueness:true
  belongs_to :city
  has_many :posted_gossips, foreign_key: 'author_id', class_name: 'Gossip', dependent: :destroy
  has_many :comments, foreign_key: 'commentator_id', dependent: :destroy
  has_many :commented_gossips, :through => :comments, :source => :gossip
end
