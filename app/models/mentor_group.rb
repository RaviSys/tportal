class MentorGroup < ApplicationRecord
  has_many :mentors, class_name: 'User'
  validates :name, presence: true, uniqueness: true
end
