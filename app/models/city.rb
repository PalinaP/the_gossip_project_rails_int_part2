class City < ApplicationRecord
  validates:name, presence:true
  validates:zip_code, presence:true
  has_many :users
  has_many :posted_gossips, through: :users, foreign_key: 'author_id'

end
