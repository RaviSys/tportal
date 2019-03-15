class ParticipantProgram < ApplicationRecord
  belongs_to :program, optional: true
  belongs_to :participant, class_name: 'User', optional: true
  ransack_alias :participant,
    :participant_first_name_or_participant_last_name_or_participant_name
  ransack_alias :program, :program_name

  validates :participant_id,
    uniqueness: { 
      scope: :program_id, 
      message: 'has already been assigned to this program' 
    }
  validates :participant_id, :program_id, presence: true

end
