def nod(a, b)
  while b != 0
    a, b = b, a % b
  end
  a
end

def is_numbers_coprime?(a,b)
  nod(a,b)==1
end

def count_prime_numbers(number)
  count = 0
  (2..number).each do |i|
    if is_numbers_coprime?(number,i)
      count += 1
    end
  end
  count
end

def is_prime?(number)
  if number <= 1
    return false
  end
  (2...number).each do |i|
    if number % i == 0
      return false
    end
  end
  true
end

def sum_digit_div_by3(number)
  sum = 0
  while number > 0
    digit = number % 10
    if digit % 3 == 0
      sum += digit
    end
    number = number / 10
  end
  sum
end


def count_mutually_prime_digits(divisor, number)
  count = 0
  while number > 0
    digit = number % 10
    count += 1 if is_numbers_coprime?(divisor, digit)
    number /= 10
  end
  count
end

def coprime_divisor_with_digits(number)
  temp_div_count=0
  best_div = 0
  (2...number).each do |i|
    if number % i == 0 && count_mutually_prime_digits(i,number)>temp_div_count
        temp_div_count=count_mutually_prime_digits(i,number)
        best_div=i
    end
  end
  best_div
end

def menu(task)
  case task
  when "1"
    task_1
  when "2"
    task_2
  when "3"
    task_3
  else
    puts"Некорректный ввод"
  end
end

def task_1
  puts "*****ЗАДАЧА 1.2.1***** \n Введите ваше число"
  your_number = STDIN.gets.to_i
  puts "Кол-во чисел, взаимнопростых с заданным: #{count_prime_numbers(your_number)}" #1 пункт
end

def task_2
  puts "*****ЗАДАЧА 1.2.2***** \n Введите ваше число"
  your_number = STDIN.gets.to_i
  puts "Сумма цифр заданного числа, делящихся на 3: #{sum_digit_div_by3(your_number)}" #2 пункт
end

def task_3
  puts "*****ЗАДАЧА 1.2.3***** \n Введите ваше число"
  your_number = STDIN.gets.to_i
  puts "ВОТ ВАШ ДЕЛИТЕЛЬ ЧИСЛА, ЯВЛЯЮЩИЙСЯ ВЗАИМНОПРОСТЫМ С НАИБОЛЬШИМ КОЛ-ВОМ ЦИФР ВАШЕГО ЧИСЛА: #{coprime_divisor_with_digits(your_number)}" #3 пункт
  end

task = ARGV[0]
menu(task)
