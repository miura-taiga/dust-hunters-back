class Api::V1::GuildCardsController < ApplicationController
  def show
    if @current_user
      guild_cards = GuildCard.where(user_id: @current_user.id)
      render json: guild_cards, each_serializer: GuildCardSerializer, status: :ok
    else
      render json: { error: '認証情報を取得できません' }, status: :unauthorized
    end
  end

  def increment_defeat_count
    guild_card = GuildCard.find_by(user_id: @current_user.id, monster_id: params[:monster_id])

    if guild_card
      guild_card.increment!(:defeat_count)
      render json: guild_card, status: :ok
    else
      render json: { error: '該当モンスターのギルドカードが見つかりません' }, status: :not_found
    end
  end

  private

  def guild_card_params
    params.require(:guild_card).permit(:defeat_count)
  end
end
