class Api::V1::UserQuestsController < ApplicationController
  before_action :authenticate_request

  def create
    user_quest = UserQuest.find_or_create_by!(
      user_id: @current_user.id,
      quest_id: params[:quest_id]
    )
    render json: user_quest, status: :created
  end

  def complete
    user_quest = UserQuest.find_by!(user_id: @current_user.id, quest_id: params[:quest_id])
    user_quest.update!(defeated_at: Time.current)

    render json: user_quest, serializer: UserQuestSerializer, status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: { error: '該当するクエストが見つかりません' }, status: :not_found
  end
end
