class SerializableTask < JSONAPI::Serializable::Resource
  type 'tasks'

  attributes :id, :name, :priority, :goal, :unit

  attribute :routine do
    @object.routine.name
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
    data do
      {
        created_by: @object.user.name
      }
    end
  end

  belongs_to :routine do
    link :related do
      "/api/v1/routine/#{@object.routine.id}"
    end
    data do
      {
        routine: @object.routine.name,
        routine_id: @object.routine.id
      }
    end
  end

  link :self do
    @url_helpers.api_v1_task_path(@object.id)
  end

  meta do
    { count: Task.user.count }
  end
end
