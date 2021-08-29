class SerializableMesurement < JSONAPI::Serializable::Resource
  extend JSONAPI::Serializable::Resource::KeyFormat
  key_format ->(key) { key.to_s.dasherize }

  type 'Mesurements'

  attributes :id, :quantity, :created_at

  # attribute :creation_date do
  #   @object.created_at
  # end

  attribute :task_id do
    @object.task.id
  end

  attribute :task_name do
    @object.task.name
  end

  attribute :task_icon do
    @object.task.icon
  end

  attribute :unity do
    @object.task.unit
  end

  belongs_to :task do
    data do
      @object.task
    end
  end
end
