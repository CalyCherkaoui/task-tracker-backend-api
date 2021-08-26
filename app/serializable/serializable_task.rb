class SerializableTask < JSONAPI::Serializable::Resource
  extend JSONAPI::Serializable::Resource::KeyFormat
  key_format ->(key) { key.to_s.dasherize }

  type 'tasks'

  attributes :id, :name, :priority, :goal, :unit

  attribute :routine do
    @object.routine.name
  end

  attribute :author_id do
    @object.user.id
  end

  attribute :icon do
    @object.icon
  end

  attribute :creation_date do
    @object.created_at
  end

  attribute :measurements_count do
    @object.measurements_count
  end

  attribute :measurements_total do
    @object.measurements_total
  end

  belongs_to :user do
    data do
      @object.user
    end
  end

  belongs_to :routine do
    data do
      @object.routine
    end
  end

  has_many :mesurements do
    data do
      @object.mesurements
    end
  end

  meta do
    { routine: @object.routine }
  end
end
