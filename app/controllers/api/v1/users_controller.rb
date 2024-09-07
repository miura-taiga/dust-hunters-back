class Api::V1::UsersController < ApplicationController
  before_action :authenticate_request, only: %i[show update current]
  before_action :set_user, only: %i[update]

  def index
    users = User.all
    render json: users
  end

  def show
    if @current_user
      render json: { user: @current_user }
    else
      render json: { error: '認証情報を取得できません' }, status: :unauthorized
    end
  end

  def update
    if @current_user.update(user_params)
      render json: @current_user, status: :ok
    else
      render json: { errors: @current_user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def current
    if @current_user
      render json: { user: @current_user }
    else
      render json: { error: '認証情報を取得できません' }, status: :unauthorized
    end
  end

  private

  def set_user
    user_authentication = UserAuthentication.find_by!(uid: params[:uid])
    @user = user_authentication.user
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'ユーザーが見つかりません' }, status: :not_found
  end

  def user_params
    params.require(:user).permit(:name, :gender)
  end
end
