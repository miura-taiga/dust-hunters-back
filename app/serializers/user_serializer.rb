class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :gender, :hunterRank
end
