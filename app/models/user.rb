class User < ApplicationRecord
  has_many :posted_gossips, foreign_key: 'author_id', class_name: 'Gossip'
end
