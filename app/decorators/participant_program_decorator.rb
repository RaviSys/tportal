class ParticipantProgramDecorator < ApplicationDecorator
  delegate_all

  def program_name
    object.program.name
  end

  def participant_name
    object.participant.name
  end

end
