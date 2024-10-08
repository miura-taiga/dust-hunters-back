class Api::V1::UsersController < ApplicationController
  before_action :authenticate_request, only: %i[show update increment_hunter_rank current]

  # API確認用
  def index
    users = User.all
    render json: users
  end

  def show
    if @current_user
      render json: @current_user, serializer: UserSerializer
    else
      render json: { error: '認証情報を取得できません' }, status: :unauthorized
    end
  end

  def update
    if @current_user.update(user_params)
      render json: @current_user, serializer: UserSerializer, status: :ok
    else
      render json: { errors: @current_user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def increment_hunter_rank
    user_authentication = UserAuthentication.find_by!(uid: params[:uid], provider: 'google_oauth2')
    user = User.find_by!(id: user_authentication.user_id)

    user.increment!(:hunterRank)
    render json: user, serializer: UserSerializer, status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'ユーザーが見つかりません' }, status: :not_found
  end

  def current
    if @current_user
      render json: { user: @current_user }
    else
      render json: { error: '認証情報を取得できません' }, status: :unauthorized
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :gender, :hunterRank)
  end
end
