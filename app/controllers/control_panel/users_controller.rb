class ControlPanel::UsersController < ControlPanelController
  before_action :set_user, only: [:edit, :update]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params_user)
    if @user.save
      redirect_to control_panel_users_path, notice: 'messages.created_with', item: @user.email
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(params_user)
      redirect_to control_panel_users_path, notice: 'messages.updated_with', item: @user.email
    else
      render :edit
    end
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def params_user
      if password_blank?
        params[:user].delete(:password)
        params[:user].delete(:password_confirmation)
      end

      if @user.blank?
        params.require(:user).permit(:email, :position, :password, :password_confirmation)
      else
        params.require(:user).permit(:email, :position, :password, :password_confirmation)
      end
    end

    def password_blank?
      params[:user][:password].blank? &&
      params[:user][:password_confirmation].blank?
    end

end
