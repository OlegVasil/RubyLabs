####_1.1_####
puts "Hello World"

####_1.2._####
puts "Здравствуйте! Как к Вам обращаться?"
name = gets.chomp
puts "Очень приятно," + name
puts "Введите любимый язык (программирования)"
language = gets.chomp
case language
when "Ruby"
  puts "Что пользователь подлиза"
when "c++"
  puts "Правда?"
when "HTML"
  puts "Введите язык ПРОГРАММИРОВАНИЯ"
else
  puts "Хм...Ладно"
end

####_1.3._###
puts name+", введите команду на Ruby"
r_command = gets
#system ("ruby -e "+r_command)

puts name+", введите команду ОС" #ls
oc_command = gets.chomp
system (oc_command)
