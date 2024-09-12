class GuildCardSerializer < ActiveModel::Serializer
  attributes :id, :defeat_count, :monster_name

  def monster_name
    object.monster.name
  end
end
