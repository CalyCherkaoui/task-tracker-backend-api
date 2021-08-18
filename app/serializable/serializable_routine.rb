class SerializableRoutine < JSONAPI::Serializable::Resource
  type 'routines'

  attributes :id, :name, :icon, :priority

  attribute :ordered_tasks do
    @object.ordered_tasks
  end

  attribute :hero_task do
    @object.hero_task
  end

  attribute :tasks_count do
    @object.tasks_count
  end

  link :self do
    @url_helpers.api_v1_routine_path(@object.id)
  end

  meta do
    { count: Routine.count }
  end
end
