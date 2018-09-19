class Comment < ApplicationRecord
  belongs_to :user
  
  belongs_to :post
  
  belongs_to :parent,
  foreign_key: :parent_comment_id,
  primary_key: :id,
  class_name: :Comment,
  optional: true
  
  has_many :child_comments,
  primary_key: :id,
  foreign_key: :parent_comment_id,
  class_name: :Comment
  
end
