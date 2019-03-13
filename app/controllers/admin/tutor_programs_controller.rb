class Admin::TutorProgramsController < AdminController
  include Concerns::AdminCrud

  def assign_tutors
    @users = User.roled_users('tutor')
    @programs = Program.all
  end

end
