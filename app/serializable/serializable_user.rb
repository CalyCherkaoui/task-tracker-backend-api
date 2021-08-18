class SerializableUser < JSONAPI::Serializable::Resource
  extend JSONAPI::Serializable::Resource::KeyFormat
  key_format ->(key) { key.to_s.dasherize }

  type 'users'

  attributes :email, :id, :username

  attribute :date do
    @object.created_at
  end

  has_many :tasks do
    data do
      @object.sorted_tasks
    end
  end

  # has_many :tasks do
  #   linkage do
  #     @object.sorted_tasks.map do |t|
  #       {
  #         id: t.id.to_s,
  #         name: t.name,
  #         priority: t.priority,
  #         goal: t.goal,
  #         unit: t.unit,
  #         routine: t.routine.name,
  #         routine_link: "/api/v1/routines/#{t.routine.id}"
  #       }
  #     end
  #   end
  # end

  link :self do
    @url_helpers.api_v1_user_path(@object.id)
  end

  meta do
    { admin: false }
  end
end
