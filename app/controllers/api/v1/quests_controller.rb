class Api::V1::QuestsController < ApplicationController
  def index
    @quests = Quest.all
    render json: @quests, each_serializer: QuestSerializer
  end

  def show
    @quests = Quest.find_by!(id: params[:id])
    render json: @quests, serializer: QuestSerializer
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'モンスターが見つかりませんでした' }, status: :not_found
  end
end
