class TasksRepresenter
  def initialize(tasks)
    @tasks = tasks
  end

  def as_json
    tasks.map do |task|
      {
        id: task.id,
        name: task.name
      }
    end
  end

  private

  attr_reader :tasks
end
