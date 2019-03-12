class Admin::UsersController < AdminController
  include Concerns::AdminCrud

  def index
    if params[:role].present?
      @q = User.roled_users(params[:role]).ransack(params[:q])
    else
      @q = User.ransack(params[:q])
    end
    @users = @q.result.order(id: :asc).page(params[:page]).per(10)
    respond_to do |format|
      format.html
    end
  end

  private

    def user_params
      params.require(:user).permit!
    end
end
