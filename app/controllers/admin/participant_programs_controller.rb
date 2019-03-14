class Admin::ParticipantProgramsController < AdminController
  include Concerns::AdminCrud

  def assign_participants
    @users = User.roled_users('participant')
    @programs = Program.all
  end

  def create_multiple_pp
    @program = Program.find(params[:participants][:program_id])
    if params[:participant_ids].present?
      params[:participant_ids].map {|pid| @program.participant_programs.create(participant_id: pid) }
      redirect_to admin_program_path(@program),
        flash: { success: "Participants assigned successfully to #{@program.name}" }
    end
  end

end
