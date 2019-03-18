class Admin::ProgramsController < AdminController
  before_action :find_program, only: [:check_if_assigned_to_tutors, :check_if_assigned_to_participants, :add_lectures, :create_lectures]
  include Concerns::AdminCrud

  def settings;end

  def check_if_assigned_to_tutors
    unless params[:id] == 'blank'
      if @program.tutors.present?
        @users = User.roled_users('tutor')
          .where('id NOT IN (?)', @program.tutors.ids)
        @tutors = User.roled_users('tutor')
          .where('id IN (?)', @program.tutors.ids)
      else 
        @users = User.roled_users('tutor')
      end
    end
  end

  def check_if_assigned_to_participants
    unless params[:id] == 'blank'
      if @program.participants.present?
        @users = User.roled_users('participant')
          .where('id NOT IN (?)', @program.participants.ids)
        @participants = User.roled_users('participant')
          .where('id IN (?)', @program.participants.ids)
      else 
        @users = User.roled_users('participant')
      end
    end
  end

  def add_lectures
    @weekdays = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']
  end

  def create_lectures
    start_date = @program.to_be_start_from
    end_date = @program.to_be_end_upto
    my_days = params[:wdays].map {|i| i.to_i}
    lecture_dates = (start_date..end_date).to_a.select {|k| my_days.include?(k.wday)}
    lecture_dates.each do |date|
      begin_time = (date.to_s + " #{params[:lectures][:begin_time].to_s}").to_time.to_datetime
      end_time = (date.to_s + " #{params[:lectures][:end_time].to_s}").to_time.to_datetime
      @program.lectures.create(title: 'Test Topic', begin_time: begin_time, end_time: end_time)
    end
    redirect_to admin_program_path(@program),
      flash: { success: 'Lectures has been created successfully.' }
  end

  private

    def program_params
      params.require(:program).permit!
    end

    def find_program
      @program = Program.find(params[:id]) unless params[:id] == 'blank'
    end
end
