class Student
  #С помощью данного метода реализован и геттер и сеттер
  attr_accessor :id, :surname, :first_name, :patronymic, :phone, :telegram, :mail, :git

  #Конструктор данного класса
  def initialize(id, surname, first_name, patronymic=nil, phone=nil, telegram=nil, mail=nil, git=nil)
    @id = id
    @surname = surname
    @first_name = first_name
    @patronymic = patronymic
    @phone = phone
    @telegram = telegram
    @mail = mail
    @git = git
  end

  #ФИО
  def full_name
    if @patronymic
      "#{@surname} #{@first_name} #{@patronymic}"
    else
      "#{@surname} #{@first_name}"
    end
  end
end
