class TasksRepresenter
  def initialize(tasks)
    @tasks = tasks
  end

  def as_json
    tasks.map do |tasks|
      {
        id: tasks.id,
        name: tasks.name,
        icon: tasks.icon,
      }
    end
  end

  private

  attr_reader :tasks
end