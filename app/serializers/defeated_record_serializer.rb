class DefeatedRecordSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :quest_id, :defeated_at

  belongs_to :user
  belongs_to :quest
end
