class Student
  #Краткое объявление метода
  attr_reader :id, :last_name, :first_name, :surname, :phone, :telegram, :mail, :git

  def initialize(last_name, first_name, surname, options = {})
    @last_name = last_name
    @first_name = first_name
    @surname = surname
    #options = {} - аргумент конструктора в форме ХЭШа
    @id = options[:id]
    @phone = options[:phone]
    @telegram = options[:telegram]
    @mail = options[:mail]
    @git = options[:git]
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

  #Валидация контактов с true или false
  def has_git?
    !git.nil?
  end

  def has_contact?
    !phone.nil? || !telegram.nil? || !mail.nil?
  end

  def validate_all
    has_git? && has_contact?
  end

  #Я просто хочу чтобы это было и красиво выводилось
  def validate_contacts
    if validate_all
     puts("Телефон: #{phone}, Телеграм: #{telegram}, Почта: #{mail}")
    else
      puts "Контактов нема :c"
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


