class Admin::LecturesController < AdminController
  include Concerns::AdminCrud
  before_action :find_lecture, only: %i[show edit]
  before_action :make_time, only: :make_time

  def index
    @program = Program.find(params[:program_id])
    @lectures = @program.lectures.page(params[:page]).per(10)
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
end
