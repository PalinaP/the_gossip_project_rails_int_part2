class Gossip < ApplicationRecord
  validates :title, presence: true, length: { in: 3..14 }
  validates :content, presence: true
  belongs_to :author, class_name: "User"
  has_many :comments
  has_many :commentators, :source => :user, :foreign_key => 'commentator_id', :through => :comments
end
