class MonsterSerializer < ActiveModel::Serializer
  attributes :id, :name, :body, :start_battle_image_url, :end_battle_image_url, :bestiary_monster_image_url
end
