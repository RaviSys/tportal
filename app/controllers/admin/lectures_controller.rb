class Admin::LecturesController < AdminController
  include Concerns::AdminCrud
  before_action :find_lecture, only: %i[show edit]
  before_action :make_time, only: :make_time

  def index

    @program = Program.find(params[:program_id])

    if ActiveModel::Type::Boolean.new.cast(params[:calender])
      @lectures = @program.lectures
      calender_data
      render 'lecture_calender'
    else
      @lectures = @program.lectures.page(params[:page]).per(10)
    end
  end

  def show; end

  def edit; end

  def update
    redirect_to admin_program_lectures_path(@lecture.program) if @lecture.update(lecture_params)
  end

  private

    def lecture_params
      params.require(:lecture).permit!
    end

    def find_lecture
      @lecture = Lecture.find_by(id: params[:id])
    end

    def make_time
      lecture_params[:begin_time] = DateTime.parse lecture_params[:begin_time].split("/").join(' (IST)')
      lecture_params[:end_time] = DateTime.parse lecture_params[:end_time].split("/").join(' (IST)')
    end

    def calender_data
      lecture_arr = []
      @lectures.each do |lecture|
        lecture_event = {}
        lecture_event['id'] = lecture.id
        lecture_event['title'] = lecture.title
        lecture_event['title'] = lecture.title
        lecture_event['start'] = lecture.begin_time
        lecture_event['end'] = lecture.end_time
        lecture_arr << lecture_event
      end
      gon.push({ events: lecture_arr })
    end
end
