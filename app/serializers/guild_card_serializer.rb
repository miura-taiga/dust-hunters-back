class GuildCardSerializer < ActiveModel::Serializer
  attributes :id, :defeat_count, :monster_name, :bestiary_monster_image_url

  def monster_name
    object.monster.name
  end

  def bestiary_monster_image_url
    object.monster.bestiary_monster_image_url
  end
end
