require_relative 'task.rb'

class TaskPrinter

  def self.find_task(tasks, term)
    tasks.each do |task|
      if task.has_task(term)
        return task
      end
    end
    return "Task Not found"
  end

  def self.print_task(task)
      puts task.to_s
  end

  def self.list_tasks(tasks)
    tasks.each_with_index do |item, index|
      puts item.to_s
    end
  end

  def self.save_tasks(tasks)
    File.open('task.csv', 'w') do |file|
      file.write("task;status;deadline\n")
      tasks.each_with_index do |item, index|
        file.write("#{item.description};#{item.status};#{item.deadline}\n")
      end
    end
  end

  def self.load_tasks
    tasks = []
    csv = CSV.parse(File.read('/Users/bnascimento/workspace/exemplo_git/Pre_Curso/task.csv'), headers: true, encoding: "bom|utf-8" , col_sep: ';')
    csv.each do |row|
      task = TaskWithDeadline.new(row['task'], row['status'], row['deadline'])
      print_task(task)
      tasks << task
    end
    return tasks
  end
end
