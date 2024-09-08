class Api::V1::MonstersController < ApplicationController
  def index
    @monsters = Monster.all
    render json: @monsters, each_serializer: MonsterSerializer
  end

  def show
    @monster = Monster.find_by!(id: params[:id])
    render json: @monster, serializer: MonsterSerializer
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'モンスターが見つかりませんでした' }, status: :not_found
  end
end
