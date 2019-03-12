class TutorProgram < ApplicationRecord
  belongs_to :program, optional: true
  belongs_to :tutor, class_name: 'User', optional: true
end
