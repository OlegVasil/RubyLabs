require_relative 'student'
#student = Student.new("Душнилин", "Кирилл", "Кириллович")
#student.id = "2"
#student.phone = "88005553535"
#student.telegram = "kirill"
#student.mail = "kirill@mail.com"

#jorik = Student.new("Воронин", "Георгий", "Отчество",   {git: 'git'})

#student.git = "kirilll"
#puts jorik
#puts jorik.validate_contacts
#puts(student)
#puts Student.is_git?("git")
#student.set_contacts({telegram: 'telega'})
#puts student.telegram

#st1 = Student.new(last_name: "Vas", first_name: "V", surname: "C")
#puts st1
#
#st2=Student.from_json_str('{"last_name":"A", "first_name": "B", "surname": "C"}')
#puts st2
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
