class Task::Position
  def self.call(task, position)
    case position
    when 'move_up' then task.move_higher
    when 'move_down' then task.move_lower
    end
  end
end
