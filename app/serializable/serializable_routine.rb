class SerializableRoutine < JSONAPI::Serializable::Resource
  extend JSONAPI::Serializable::Resource::KeyFormat
  key_format ->(key) { key.to_s.dasherize }

  type 'routines'

  attributes :id, :name, :icon, :priority, :created_at

  has_many :tasks do
    data do
      @object.tasks
    end
  end

  meta do
    { count: Routine.count }
  end
end
