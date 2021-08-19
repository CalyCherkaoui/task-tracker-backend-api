class SerializableTask < JSONAPI::Serializable::Resource
  extend JSONAPI::Serializable::Resource::KeyFormat
  key_format ->(key) { key.to_s.dasherize }

  type 'tasks'

  attributes :id, :name, :priority, :goal, :unit

  attribute :routine do
    @object.routine.name
  end

  attribute :author do
    @object.user.username
  end

  attribute :icon do
    @object.icon
  end

  attribute :creation_date do
    @object.created_at
  end

  belongs_to :user do
    link :related do
      "/api/v1/users/#{@object.user.id}"
    end
  end

  belongs_to :routine do
    data do
      @object.routine
    end

    link :related do
      "/api/v1/routines/#{@object.routine.id}"
    end
  end

  has_many :mesurements do
    data do
      @object.mesurements
    end
  end

  link :self do
    @url_helpers.api_v1_task_path(@object.id)
  end
end
