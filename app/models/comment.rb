class Comment < ApplicationRecord
  belongs_to :gossip
  belongs_to :commentator, class_name: "User"
end
