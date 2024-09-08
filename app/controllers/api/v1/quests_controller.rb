class Api::V1::QuestsController < ApplicationController
  def index
    @monsters = Monster.all
    render json: @monsters, each_serializer: QuestSerializer
  end

  def show
    @monster = Monster.find_by!(id: params[:id])
    render json: @monster, serializer: QuestSerializer
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'モンスターが見つかりませんでした' }, status: :not_found
  end
end
