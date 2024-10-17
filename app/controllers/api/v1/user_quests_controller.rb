class Api::V1::UserQuestsController < ApplicationController
  before_action :authenticate_request

  def defeated_records
    user_auth = UserAuthentication.find_by!(uid: params[:uid])
    defeated_records = DefeatedRecord.where(user_id: user_auth.user_id).pluck(:defeated_at)

    if defeated_records.present?
      render json: { defeated_at: defeated_records }, status: :ok
    else
      render json: { error: '該当する活動履歴が見つかりません' }, status: :not_found
    end
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'ユーザーが見つかりません' }, status: :not_found
  end

  def create
    user_quest = UserQuest.find_or_create_by!(
      user_id: @current_user.id,
      quest_id: params[:quest_id]
    )
    render json: user_quest, status: :created
  end

  def complete
    user_quest = UserQuest.find_or_create_by!(
      user_id: @current_user.id,
      quest_id: params[:quest_id]
    )

    defeated_record = DefeatedRecord.create!(
      user_id: @current_user.id,
      quest_id: user_quest.quest_id,
      defeated_at: Time.current
    )

    render json: defeated_record, serializer: DefeatedRecordSerializer, status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'クエストまたはユーザーが見つかりません' }, status: :not_found
  end
end
