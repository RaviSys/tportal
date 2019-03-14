class Admin::TutorProgramsController < AdminController
  include Concerns::AdminCrud

  def assign_tutors
    @users = User.roled_users('tutor')
    @programs = Program.all
  end

  def create_multiple_tp
    @program = Program.find(params[:tutors][:program_id])
    if params[:tutor_ids].present?
      params[:tutor_ids].map {|tid| @program.tutor_programs.create(tutor_id: tid) }
      redirect_to admin_program_path(@program),
        flash: { success: "Tutors assigned successfully to #{@program.name}" }
    end
  end

end
