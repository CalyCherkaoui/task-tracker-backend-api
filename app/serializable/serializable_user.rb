class SerializableUser < JSONAPI::Serializable::Resource
  extend JSONAPI::Serializable::Resource::KeyFormat
  key_format ->(key) { key.to_s.dasherize }

  type 'users'

  attributes :email, :username, :id

  has_many :tasks do
    data do
      @object.hero_task
    end
  end

  meta do
    { admin: @object.admin }
  end
end
