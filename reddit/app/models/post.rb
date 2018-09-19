class Post < ApplicationRecord
  validates :title, presence: true
  
  belongs_to :user
  
  belongs_to :sub
  
  has_many :comments
end
