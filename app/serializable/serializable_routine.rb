class SerializableRoutine < JSONAPI::Serializable::Resource
  extend JSONAPI::Serializable::Resource::KeyFormat
  key_format ->(key) { key.to_s.dasherize }

  type 'routines'

  attributes :id, :name, :icon, :priority

  attribute :tasks_count do
    @object.tasks_count
  end

  has_many :tasks do
    data do
      @object.ordered_tasks
    end

    hero_task do
      @object.hero_task
    end
  end

  link :self do
    @url_helpers.api_v1_routine_path(@object.id)
  end

  meta do
    { count: Routine.count }
  end
end
