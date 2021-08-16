class SerializableUser < JSONAPI::Serializable::Resource
  type 'users'

  attributes :email, :id, :username

  attribute :date do
    @object.created_at
  end

  link :self do
    @url_helpers.api_v1_user_url(@object.id)
  end
end
