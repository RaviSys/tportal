class Admin::UsersController < AdminController
  include Concerns::AdminCrud

  private

    def user_params
      params.require(:user).permit!
    end
end
