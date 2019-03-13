class Admin::ParticipantProgramsController < AdminController
  include Concerns::AdminCrud

  def assign_participants
    @users = User.roled_users('participant')
    @programs = Program.all
  end

end
