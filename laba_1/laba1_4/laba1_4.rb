# def min_elem_index(array) #2 - Индекс минимального элемента
#   min_element = array[0]
#   min_index = 0
#   array.each_with_index do |element, index|
#     if element < min_element
#       min_element = element
#       min_index = index
#     end
#   end
#   min_index
# end


def count_elem_interval(array, a, b) #14 - Кол-во элементов на интервале
  if array.length >= b && a<b
    b-a-1
  else
    -1
  end
end


def elem_between_first_and_last_min(array) #26 - Подсчет кол-ва элементов между минимумами
  min = array.min
  first_index = array.index(min)
  last_index = array.rindex(min)
  if last_index == first_index
    -1
  else
    last_index - first_index - 1
  end
end


def count_elem_in_interval(array, a, b) #38 - Подсчет кол-ва элементов, значение которых принадлежит отрезку a...b
  if a<b
    -1
  else
    array.count { |element| element > a && element < b } #count лучше :)
  end
end


def menu_list #Менюшка для выбора задачи
  puts()
  puts "Выберите задачу:"
  puts "1.Индекс минимального элемента." #Пример ввода : 55 33 5 15 47 33 15
  puts "2.Количество элементов из интервала a...b." #Пример ввода: 2 8 1 2 3 4 5 6 7 8 9 10, где первые 2 элемента - интервал
  puts "3.Количество элеменов между первым и последним минимальным." #Пример ввода: 2 9 1 343 3424 2 22 1 99
  puts "4.Количество элементов, значение которых принадлежит отрезку a...b." #Пример ввода: 2 8 1 2 3 4 32 45 5 6 7 8 9, где первые 2 элемента - интервал
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
    puts "Вы выбрали файлы. \n\nУчтите, файл должен лежать в директории с программой. \nВведите название\n"
    input_file = "./ #{gets.chomp}"
    File.open(input_file)
    array = input_file.readline.split(' ').map(&:to_i)
  when 2
    puts "Вы выбрали ручной ввод. \n\nВведите ваши данные через пробел.\n"
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
    puts "Индекс минимального элемента: #{array.index(array.min)}" #Метод уместился в одну строчку
  when 2
    a = array[0]
    b = array[1]
    new_array = array.drop(2)
    if count_elem_interval(new_array,a,b) == -1
      puts "Неккоректный ввод"
    else
      puts "Количество элементов на интервале #{a}...#{b}: #{count_elem_interval(new_array,a,b)} "
    end
  when 3
    if elem_between_first_and_last_min(array) == -1
      puts "Тут только одно вхождение минимума"
    else
      puts "Количество элеменов между первым и последним минимальным: #{elem_between_first_and_last_min(array)}"
    end

  when 4
    a = array[0]
    b = array[1]
    new_array = array.drop(2)
    if count_elem_in_interval(new_array,a,b) == -1
      puts "Неккоректный ввод"
    else
      puts "Количество элементов, значение которых принадлежит отрезку #{a}...#{b}: #{count_elem_in_interval(new_array,a,b)} "
    end
    
  when 5
    puts "Еще не готово"
  end
end

results(task,array)
