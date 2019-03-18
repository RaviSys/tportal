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
      format.csv { send_data User.all.to_csv, filename: "users-#{Date.today}.csv" }
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

    def user_params
      params.require(:user).permit!
    end
end
