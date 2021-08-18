class SerializableRoutine < JSONAPI::Serializable::Resource
  type 'routines'

  attributes :id, :name, :icon, :priority

  link :self do
    @url_helpers.api_v1_routine_path(@object.id)
  end

  meta do
    { count: @object.count }
  end
end
