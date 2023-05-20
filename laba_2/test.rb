require_relative 'student'
require_relative 'student_short'
require_relative 'data_table'
require_relative 'data_list_student_short'
require 'sqlite3'
require_relative 'student_list_db'
require_relative 'db_students'

connect = SQLite3::Database.new('db_student.sql')
ans = connect.query('SELECT * FROM students')
ans.each do |row|
  puts row
end


# def resad_from_txt(file_path)
#   raise ArgumentError, 'Файл не найден' unless File.exist?(file_path)
#   file = File.open(file_path){|file| file.read}
#   JSON.parse(file).inject([]) do |list, student|
#     list << Student.from_json_str(student.to_json)
#   end
# end
#
# st_list=read_from_txt('/home/oleg/Рабочий стол/ПАТТЕРНЫ/laba_2/laba_2_1/students_input')
# st_list.each do |st|
#   puts st.get_info
# end
#
# def write_to_txt(file_path, student_list)
#   res = '['
#   student_list.each do |st|
#     res += st.to_json_str + ","
#   end
#   res = res.chop + "]"
#   File.write(file_path, res)
# end
#
# write_to_txt('/home/oleg/Рабочий стол/ПАТТЕРНЫ/laba_2/laba_2_1/students_out.txt',st_list)


# table=DataTable.new([[3,4],[1,2,3]])
# puts table.row_number, table.column_number
# puts 'да ' if table.get_item(0,2).nil?
# st3=Student.from_json_str('{"first_name":"Олег", "last_name": "Олегович", "surname": "Олегов"}')
# st3.set_contacts(**{phone: '88005553535'})
# puts st3
#
#
# short_1=StudentShort.new(1,'{"short_name": "Васильев О.В.", "git": "OlegVasil"}')
# puts short_1
# short_2=StudentShort.init_from_student(st3)
# puts short_2
#
# liststudentshort= DataListStudentShort.new([short_1, short_2])
# puts liststudentshort.get_data
# puts liststudentshort.get_names


st = StudentListDB.new()
st1 = st.get_student_by_id(2)
puts(st1)