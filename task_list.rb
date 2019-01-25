require 'csv'
require_relative 'task.rb'
require_relative 'task_printer.rb'
require_relative 'Task_with_deadline.rb'

tasks = []
def menu()
  puts '[1] Insert task'
  puts '[2] See tasks'
  puts '[3] Search'
  puts '[4] Change to done'
  puts '[5] Exit'
  puts
  print 'Option choosed: '

  option = gets.to_i

  option.to_i
end
tasks = TaskPrinter.load_tasks
puts "Welcome to Task List! Choose one option: \n"
option = menu()

while option != 5 do
  if option == 1
    print 'Type your tasks: '
    description = gets.chomp()
    print 'Do you want to put a deadline to this task?(Y/N)'
    answer = gets.chomp()
    if answer == 'Y'
      print 'Type the deadline date(DD/MM/YYYY):'
      task = TaskWithDeadline.new(description,false, gets.chomp())
    else
      task = TaskWithDeadline.new(description, false)
    end
    tasks << task
    puts "task registred: ' #{task.to_s}"
    option = menu()
    system('clear')
  elsif option == 2
    TaskPrinter.list_tasks(tasks)
    option = menu()
    system('clear')
  elsif option == 3
    print 'Search term: '
    busca = gets.chomp
    task = TaskPrinter.find_task(tasks, busca)
    TaskPrinter.print_task(task)
    option = menu()
    system('clear')
  elsif option == 4
    TaskPrinter.list_tasks(tasks)
    print 'Choose a tasks: '
    term = gets.chomp
    task = TaskPrinter.find_task(tasks, term)
    if task.class == TaskWithDeadline
      task.mark_as_done
    else
      puts task
    end
    option = menu()
    system('clear')
  else
    puts 'Invalid option'
    option = menu()
    system('clear')
  end
end
if option == 5
  TaskPrinter.save_tasks(tasks)
end
