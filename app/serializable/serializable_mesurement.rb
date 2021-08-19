class SerializableMesurement < JSONAPI::Serializable::Resource
  extend JSONAPI::Serializable::Resource::KeyFormat
  key_format ->(key) { key.to_s.dasherize }

  type 'Mesurements'

  attributes :id, :quantity

  attribute :creation_date do
    @object.created_at
  end

  belongs_to :task do
    data do
      @object.task
    end

    link :related do
      "/api/v1/tasks/#{@object.task.id}"
    end
  end

  link :self do
    @url_helpers.api_v1_mesurement_path(@object.id)
  end
end
