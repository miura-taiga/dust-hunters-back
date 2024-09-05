class UserSerializer < ActiveModel::Serializer
  attributes :id, :uid, :name, :gender
end
