def min_elem_index(array)
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

array = [5,4,3,2,1,2,3,4,5]

puts ("Ваш массив: #{array}")
puts ("Индекс минимального элемента: #{min_elem_index(array)}")


