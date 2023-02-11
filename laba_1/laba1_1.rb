####_1.1_####
puts "Hello World"

####_1.2._####
input_name = ARGV[0]
puts "Очень приятно #{input_name}"
puts "#{input_name}, введите любимый язык (программирования)"
name = input_name
language = STDIN.gets.chomp
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
r_command = STDIN.gets
system "ruby -e \"#{r_command}\""

puts name+", введите команду ОС" #ls
oc_command = STDIN.gets.chomp
system (oc_command)
