class UserQuestSerializer < ActiveModel::Serializer
  attributes :id, :defeated_at, :user_id, :quest_id

  belongs_to :user
  belongs_to :quest
end
