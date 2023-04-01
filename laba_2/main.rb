#Подключаем наш класс в директории проета
require_relative 'student'

# #Вывод меню
def main_menu
  puts "Что Вам нужно?"
  puts "1 - Добавить студента"
  puts "2 - Вывести информацию о студентах"
  puts "3 - Выход"
  choice = input("", /^[1-3]$/).to_i
  choice
end

# #Защита от дураков
# #output - Выводим что необходимо ввести, params - регулярное выражение
def input(output, params)
  temp = ""
  until temp.match(params)
    print output
    temp = gets.chomp
    if !temp.match(params)
      raise "Неккоректный ввод"
    end
  end
  return temp
end

#Переменная для хранения студентов
students = []
student1 = Student.new(1,'Иванов','Иван','Иванович','1111111111', 'ivanivan', 'ivan@ivan.ru' , 'ivanovI')
student2 = Student.new(2,'Воронин','Георгий')
student3 = Student.new(3, 'Каралева', 'Галина', 'Царевна', '7779996660', 'galinalove', 'galya.@pochta.ru', 'galya')


#Бесконечный цикл выполняемый до выражения break
def menu(students)
  loop do
    answer = main_menu
    case answer
    when 1
      #В случае поля id, ^ - проверяет, что начало-цифра, \d - содержит цифру, "+" - одна и более, $ - проверка конца
      id = input("Введите ID: ", /^\d+$/)
      #В данном случае мы проверяем содержание целого блока латиницы и кириллицы
      last_name = input("Введите фамилию: ", /^[А-Яа-я A-Za-z]+$/)
      first_name = input("Введите имя: ", /^[А-Яа-я A-Za-z]+$/)
      surname = input("Введите отчество: ", /^[А-Яа-я A-Za-z]+$/)
      #{10} - означает, что регулярка будет соответствовать, если встретится подряд 10 цифр
      phone = input("Введите номер телефона: ", /^[\d{10}]+$/)
      telegram = input("Введите телеграм: ", /^[A-Za-z\d_-]+$/)
      email = input("Введите почту: ", /^[^@\s]+@[^@\s]+\.[^@\s]+$/)
      git = input("Введите гит: ", /^[A-Za-z\d_-]+$/)
      #puts id, last_name, first_name,surname, phone, telegram, email, git
      new_student = Student.new(id, last_name, first_name,surname, phone, telegram, email, git)
      #puts new_student
      students << new_student
      puts "Студент добавлен"
    when 2
      if students.empty?
        puts "Нет студентов"
      else
        students.each do |student|
          puts student.to_s
        end
      end
    when 3
      break
    end
  end
end

#students<<student1
menu(students)
