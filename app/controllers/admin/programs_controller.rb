class Admin::ProgramsController < AdminController
  include Concerns::AdminCrud

  private

    def program_params
      params.require(:program).permit!
    end
end
