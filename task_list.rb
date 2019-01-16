require 'csv'
require_relative 'task.rb'

tarefas = []
def menu()
  puts '[1] Inserir uma tarefa'
  puts '[2] Ver todas as tarefas'
  puts '[3] Pesquisar'
  puts '[4] Alterar tarefa para realizada'
  puts '[5] Sair'
  puts
  print 'Opção escolhida: '

  opcao = gets.to_i

  opcao.to_i
end
csv = CSV.parse(File.read('/Users/bnascimento/workspace/Pre_Curso/task.csv'), headers: true, encoding: "bom|utf-8" , col_sep: ';')
csv.each do |row|
  tarefa = Task.new(row['task'], row['status'])
  puts tarefa.to_s
  tarefas << tarefa
end
puts "Bem-vindo ao Task List! Escolha uma opção no menu: \n"
opcao = menu()

while opcao != 5 do
  if opcao == 1
    print 'Digite sua tarefa: '
    tarefa = Task.new(gets.chomp())
    tarefas << tarefa
    puts "Tarefa cadastrada: ' #{tarefa.to_s}"
    opcao = menu()
    system('clear')
  elsif opcao == 2
    tarefas.each_with_index do |item, index|
      tarefa = item
      puts tarefa.to_s
    end
    opcao = menu()
    system('clear')
  elsif opcao == 3
    print 'Termo de busca: '
    busca = gets.chomp
    termo_encontrado = []
    tarefas.each do |tarefa|
      if busca.downcase == tarefa.description.downcase
        termo_encontrado << tarefa.description
      end
    end
    if termo_encontrado.length > 0
      puts "Tarefa encontrada: #{termo_encontrado.last}"
    else
      puts "Não foi encontrado resultado para busca realizada"
    end
    opcao = menu()
    system('clear')
  elsif opcao == 4
    tarefas.each_with_index do |item, index|
      puts "##{(index + 1)} - Tarefa:#{item.to_s}"
    end
    print 'Escolha uma tarefa: '
    escolha = gets
    encontrada = false
    tarefas.each_with_index do |item, index|
      if escolha.to_i == index + 1 || escolha.chomp.downcase == item.description.downcase
        item.status = true
        puts "Tarefa alterada para realizada!"
        encontrada = true
      end
    end
    if encontrada == false
      puts "Tarefa não encontrada"
    end
    opcao = menu()
    system('clear')
  else
    puts 'Opção inválida'
    opcao = menu()
    system('clear')
  end
end
if opcao == 5
  File.open('task.csv', 'w') do |file|
    file.write("task;status\n")
    tarefas.each_with_index do |item, index|
      tarefa = item
      puts tarefa.to_s
      file.write("#{tarefa.description};#{tarefa.status}\n")
    end
  end
end
