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

st1 = Student.new(last_name: "Vas", first_name: "V", surname: "C")
puts st1

st2=Student.from_json_str('{"last_name":"A", "first_name": "B", "surname": "C"}')
puts st2
