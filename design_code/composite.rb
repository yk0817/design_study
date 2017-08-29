class Task
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def get_time_required
    0.0
  end
end


class AddMilkTask < Task

  def initialize
    super('Add dry ingredients')
  end

  def get_time_required
    1.0
  end
end

class MixTask < Task
  def initialize
    super('mix that batter up')
  end
  def get_time_required
    3.0
  end
end

class MakeBatterTask < Task
  def initialize
    super('make batter')
    @sub_tasks = []
    add_sub_task(AddMilkTask.new)
    add_sub_task(MixTask.new)
  end

  def add_sub_task(task)
    @sub_tasks << task
  end

  def remove_sub_task(task)
    @sub_tasks.delete(task)
  end

  def get_time_required
    time=0.0
    @sub_tasks.each{|task| time += task.get_time_required}
    time
  end
end

make_batter = MakeBatterTask.new
p make_batter.get_time_required
