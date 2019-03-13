class MentorGroup < ApplicationRecord
  has_many :users, class_name: 'User'
  validates :name, presence: true, uniqueness: true
end
