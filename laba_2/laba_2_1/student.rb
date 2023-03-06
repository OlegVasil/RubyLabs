class Student
  #Устанавливаем доступ к методам только на чтение (геттер, в моем понимании) - 
  #это не доступ к методам, это краткое объявление метода, типа вместо описания кучи стандартных геттеров, ты пишешь интерпретатору, какие геттеры ОН напишет сам
  attr_reader :id, :last_name, :first_name, :surname, :phone, :telegram, :mail, :git
#  а где остальные поля конструктора? мы же будем создавать записи с в том числе уже заполненными полями
  def initialize(last_name, first_name, surname)
    @last_name = last_name
    @first_name = first_name
    @surname = surname
  end

  #Валидация полей
  def self.is_id?(id)
    id.match(/^\d+$/)
  end

  def self.is_name?(name)
    name.match(/^[А-Яа-я A-Za-z]+$/)
  end

  def self.is_telegram?(telegram)
    telegram.match(/^[A-Za-z\d_-]+$/)
  end

  def self.is_mail?(mail)
    mail.match(/^[^@\s]+@[^@\s]+\.[^@\s]+$/)
  end

  def self.is_git?(git)
    git.match(/^[A-Za-z\d_-]+$/)
  end

  def self.is_phone?(phone)
    phone.match(/^[\d{10}]+$/)
  end

  #Сеттеры полей
  def id=(id)
    if Student.is_id?(id) && !id.nil?
      @id = id
    else
      raise ArgumentError, "Неккоректный id: #{id}"
    end
  end

  def phone=(phone)
    if Student.is_phone?(phone) && !phone.nil?
      @phone = phone
    else
      raise ArgumentError, "Неккоректный телефон: #{phone}"
    end
  end

  def telegram=(telegram)
    if Student.is_telegram?(telegram) && !telegram.nil?
      @telegram = telegram
    else
      raise ArgumentError, "Неккоректный телеграм #{telegram}"
    end
  end

  def mail=(mail)
    if Student.is_mail?(mail) && !mail.nil?
      @mail = mail
    else
      raise ArgumentError, "Неккоректный mail: #{mail}"
    end
  end

  def git=(git)
    if Student.is_git?(git) && !git.nil?
      @git = git
    else
      raise ArgumentError, "Неккоректный гит: #{git}"
    end
  end

  #Валидация любых контактов
  # этот метод должен возвращать тру фолс
  def validate_all
    validate_contacts
    validate_git
  end

  #Валидация гитов
  def validate_git
    if !git.nil?
      puts("git: #{git}") # ГОВНОКОДИЩЕЕ
    else
      raise "Нет гита :c" # зачем непонятное исключение, верни тру фолс и назови метод соответсвующе
    end
  end

  #Валидация контактов
  def validate_contacts
    if !(phone || telegram || mail).nil?
     puts("Телефон: #{phone}, Телеграм: #{telegram}, Почта: #{mail}")
    else
     raise "Контактов нема :c"
    end
  end

  def set_contacts(contacts)
    self.phone = contacts[:phone] if contacts.key?(:phone)
    self.telegram = contacts[:telegram] if contacts.key?(:telegram)
    self.mail = contacts[:mail] if contacts.key?(:mail)
  end

  #Переопределил метод чтобы красиво выводилось
  def to_s
    " ID: #{id}\n ФИО: #{full_name}\n Телефон: #{phone}\n telegram: #{telegram}\n mail: #{mail}\n git: #{git} "
  end
  
  #ФИО
  def full_name
    "#{@last_name} #{@first_name} #{@surname}"
  end
end
