class SerializableTask < JSONAPI::Serializable::Resource
  type 'tasks'

  attributes :id, :name, :priority, :goal, :unit

  attribute :routine do
    @object.routine.name
  end

  attribute :icon do
    @object.routine.icon
  end

  attribute :creation_date do
    @object.created_at
  end

  belongs_to :user do
    link :related do
      "/api/v1/users/#{@object.user.id}"
    end
    meta do
      {
        created_by: @object.user.name
      }
    end
  end

  belongs_to :routine do
    link :related do
      "/api/v1/routine/#{@object.routine.id}"
    end
    meta do
      {
        routine: @object.routine.name,
      }
    end
  end

  link :self do
    @url_helpers.api_v1_task_path(@object.id)
  end

  meta do
    { count: Task.count }
  end
end