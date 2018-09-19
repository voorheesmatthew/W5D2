class Sub < ApplicationRecord
  belongs_to :user
  has_many :posts
end
