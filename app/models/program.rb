class Program < ApplicationRecord
  validates :name, :description, presence: true
  has_many :tutor_programs
  has_many :tutors, through: :tutor_programs, class_name: 'User'
  has_many :participant_programs
  has_many :participants, through: :participant_programs, class_name: 'User'
end
