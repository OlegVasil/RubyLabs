def nod(a, b) #Евклидов метод вычисления НОДа
  while b != 0
    a, b = b, a % b
  end
  a
end

def count_prime_numbers(number) #Подсчет кол-ва чисел взаимнопростых с заданным
  count = 0
  (2..number).each do |i|
    if nod(number,i) == 1
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

puts ("Введите ваше число")
your_number = STDIN.gets.to_i
puts "Кол-во чисел, взаимнопростых с заданным: #{count_prime_numbers(your_number)}"

