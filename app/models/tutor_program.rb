class TutorProgram < ApplicationRecord
  belongs_to :program, optional: true
  belongs_to :tutor, class_name: 'User', optional: true
  ransack_alias :tutor,:tutor_first_name_or_tutor_last_name_or_tutor_name
  ransack_alias :program, :program_name
end
