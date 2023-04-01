require_relative 'student'

def read_from_txt(file_path)
  raise ArgumentError, 'Файл не найден' unless File.exist?(file_path)
  file = File.open(file_path){|file| file.read}
  JSON.parse(file).inject([]) do |list, student|
    list << Student.from_json_str(student.to_json)
  end
end

st_list=read_from_txt('/home/oleg/Рабочий стол/ПАТТЕРНЫ/laba_2/laba_2_1/st_i')
st_list.each do |st|
  puts st.get_info
end

def write_to_txt(file_path, student_list)
  res = '['
  student_list.each do |st|
    res += st.to_json_str + ","
  end
  res = res.chop + "]"
  File.write(file_path, res)
end

write_to_txt('/home/oleg/Рабочий стол/ПАТТЕРНЫ/laba_2/laba_2_1/students_out.txt',st_list)
