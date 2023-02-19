class Student
  #С помощью данного метода реализован и геттер и сеттер
  attr_accessor :id, :surname, :first_name, :patronymic, :phone, :telegram, :mail, :git

  #Конструктор данного класса
  def initialize(id, surname, first_name, patronymic=nil, phone=nil, telegram=nil, mail=nil, git=nil)
    @id = id
    @last_name = last_name
    @first_name = first_name
    @surname = surname
    @phone = phone
    @telegram = telegram
    @mail = mail
    @git = git
  end

  #ФИО
  def full_name
    if @surname
      "#{@last_name} #{@first_name} #{@surname}"
    else
      "#{@last_name} #{@first_name}"
    end
  end
end
