class Admin::LecturesController < AdminController 
  include Concerns::AdminCrud

  def index
    @program = Program.find(params[:program_id])
    @lectures = @program.lectures
  end

  private

    def lecture_params
      params.require(:lecture).permit!
    end
end
