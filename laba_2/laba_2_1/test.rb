require_relative 'student'
student = Student.new("Кирилл", "Душнилин", "Кириллович")
student.id = 2
student.phone = "88005553535"
student.telegram = "@kirill"
student.email = "kirill@mail.com"
student.git = "kirilll"

puts(student)