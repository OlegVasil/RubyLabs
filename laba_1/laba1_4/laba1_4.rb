def min_elem_index(array) #2 - Индекс минимального элемента
  min_element = array[0]
  min_index = 0
  array.each_with_index do |element, index|
    if element < min_element
      min_element = element
      min_index = index
    end
  end
  min_index
end

def count_elem_interval(array, a, b) #14 - Подсчет кол-ва элементов из интервала a...b из массива array
  array.select { |element| element > a && element < b }.size
end

def menu_list #Менюшка для выбора задачи
  puts()
  puts "Выберите задачу: "
  puts "1.Индекс минимального элемента" #Пример ввода : 5 15 47 33 15
  puts "2.Количество элементов из интервала a...b" #Пример ввода: 2 8 1 2 3 4 5 6 7 8 9, где первые 2 элемента - интервал
  puts "3.Количество элеменов между первым и последним минимальным"
  puts "4.Количество элементов, значение которых принадлежит отрезку a...b"
  puts "5.Неповторяющиеся элементы списков."
  answer = gets.chomp.to_i
  if answer>0 && answer<6
    answer
  else
    puts "Неккоректный ввод. \nВведите заново."
    menu_list
  end
end

def input_choice #Менюшка для выбора способа ввода
  puts()
  puts "Вам файл или клавиатуру?"
  answer = gets.chomp.to_i
  case answer
  when 1
    puts "Вы выбрали файлы. \nУчтите, файл должен лежать в директории с программой. \nВведите название"
    input_file = "./ #{gets.chomp}"
    File.open(input_file)
    array = input_file.readline.split(' ').map(&:to_i)
  when 2
    puts "Вы выбрали ручной ввод. \nВведите ваши данные через пробел"
    array = gets.chomp.split.map(&:to_i)
  else
    puts "Неккоректный ввод. \nВведите заново."
    input_choice
  end
  array
end

task = menu_list
array = input_choice

def results(task,array) #Вывод результатов
  case task
  when 1
    puts "Индекс минимального элемента: #{min_elem_index(array)}"
  when 2
    a = array[0]
    b= array[1]
    new_array = array.drop(2)
    puts"Количество элементов на интервале #{a}...#{b}: #{count_elem_interval(new_array,a,b)} "
  when 3
    puts"Еще не готово"
  when 4
    puts"Еще не готово"
  when 5
    puts"Еще не готово"
  end
end

results(task,array)
