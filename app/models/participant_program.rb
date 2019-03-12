class ParticipantProgram < ApplicationRecord
  belongs_to :program, optional: true
  belongs_to :participant, class_name: 'User', optional: true
end
