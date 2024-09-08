class Api::V1::QuestsController < ApplicationController
  def index
    @quests = Quest.all
    render json: @quests, each_serializer: QuestSerializer
  end

  def show
    @quest = Quest.find_by!(id: params[:id])
    render json: @quest, serializer: QuestSerializer
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'クエストが見つかりませんでした' }, status: :not_found
  end
end
