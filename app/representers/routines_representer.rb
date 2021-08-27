class RoutinesRepresenter
  def initialize(routines)
    @routines = routines
  end

  def as_json
    routines.map do |routine|
      {
        id: routine.id,
        name: routine.name,
        icon: routine.icon,
      }
    end
  end

  private

  attr_reader :routines
end