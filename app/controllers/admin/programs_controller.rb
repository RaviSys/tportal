class Admin::ProgramsController < AdminController
  include Concerns::AdminCrud

  def settings;end

  private

    def program_params
      params.require(:program).permit!
    end
end
