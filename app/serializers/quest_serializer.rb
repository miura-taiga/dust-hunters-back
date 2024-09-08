class QuestSerializer < ActiveModel::Serializer
  attributes :id, :title
  belongs_to :monster
end
