def find_min(array)
  return nil if array.empty?
  min = array[0]
  for element in array
    min = element if element<min
  end
  min
end

def find_positive(array)
  return nil if array.empty?
  for index in 0...array.length
    if array[index]>0
      return index
    end
  end
  return -1
end

path = ARGV[0]
task=ARGV[1]

file = File.open(path)
array = file.readline.split(' ').map(&:to_i)

def menu(task,array)
  puts("Ваш массив: #{array}")
  puts("Задачи: \n 1.Найти минимальный элемент \n 2.Найти первый положительный элемент")
  case task
  when "1"
    puts("Вы выбрали задачу: 1")
    puts("Минимальный элемент: #{find_min(array)}")
  when "2"
    puts("Вы выбрали задачу: 2")
    puts("Индекс первого положительного элемента: #{find_positive(array)}")
  else
    puts"Некорректный ввод"
  end
end

menu(task,array)
#ruby laba1_3.rb ./array.txt 1
