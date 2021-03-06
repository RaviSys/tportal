class TutorProgram < ApplicationRecord
  belongs_to :program, optional: true
  belongs_to :tutor, class_name: 'User', optional: true
  ransack_alias :tutor,:tutor_first_name_or_tutor_last_name_or_tutor_name
  ransack_alias :program, :program_name

  validates :tutor_id,
    uniqueness: { 
      scope: :program_id, 
      message: 'has already been assigned to this program' 
    }

  validates :tutor_id, :program_id, presence: true

  delegate :name, to: :program, allow_nil: true, prefix: :program
  delegate :name, to: :tutor, allow_nil: true, prefix: :tutor

end
