puts 'Digite seu nome:'
nome = gets.strip
puts 'Digite sua idade:'
idade = gets.strip

#puts "Seu nome é #{nome}"
#puts "Sua idade é #{idade}"

if idade.to_i > 18
  puts "Parabéns #{nome} você está apto para dirigir"
elsif idade.to_i == 18
  puts "Parabéns #{nome} você está apto para tirar sua habilitação"
else
  puts "Infelizmente #{nome} você não está apto para dirigir"
end
