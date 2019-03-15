class Admin::ProgramsController < AdminController
  before_action :find_program, only: [:check_if_assigned_to_tutors, :check_if_assigned_to_participants]
  include Concerns::AdminCrud

  def settings;end

  def check_if_assigned_to_tutors
    unless params[:id] == 'blank'
      if @program.tutors.present?
        @users = User.roled_users('tutor').where('id NOT IN (?)', @program.tutors.ids)
        @tutors = User.roled_users('tutor').where('id IN (?)', @program.tutors.ids)
      else 
        @users = User.roled_users('tutor')
      end
    end
  end

  def check_if_assigned_to_participants
    unless params[:id] == 'blank'
      if @program.participants.present?
        @users = User.roled_users('participant').where('id NOT IN (?)', @program.participants.ids)
        @participants = User.roled_users('participant').where('id IN (?)', @program.participants.ids)
      else 
        @users = User.roled_users('participant')
      end
    end
  end

  private

    def program_params
      params.require(:program).permit!
    end

    def find_program
      @program = Program.find(params[:id]) unless params[:id] == 'blank'
    end
end
