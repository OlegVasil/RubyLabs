class Student
  #Краткое объявление метода
  attr_reader :id, :last_name, :first_name, :surname, :phone, :telegram, :mail, :git

  def initialize(options={})
    #options = {} - аргумент конструктора в форме ХЭШа
    raise ArgumentError, 'Отсутствуют необходимые поля!' unless options.key?(:last_name) && options.key?(:first_name) && options.key?(:surname)
    self.last_name = options[:last_name]
    self.first_name = options[:first_name]
    self.surname = options[:surname]
    self.id = options[:id]
    self.phone = options[:phone]
    self.telegram = options[:telegram]
    self.mail = options[:mail]
    self.git = options[:git]
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
  def last_name=(last_name)
    if Student.is_name?(last_name) && !last_name.nil?
      @last_name = last_name
    else
      raise ArgumentError, "Неккоректная фамилия: #{last_name}"
    end
  end


  def first_name=(first_name)
    if Student.is_name?(first_name) && !first_name.nil?
      @first_name = first_name
    else
      raise ArgumentError, "Неккоректное имя: #{first_name}"
    end
  end

  def surname=(surname)
    if Student.is_name?(surname)&& !surname.nil?
      @surname = surname
    else
      raise ArgumentError, "Неккорректное отчество: #{surname}"
    end
  end

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

  #Здесь был метод с puts

  def set_contacts(contacts)
    self.phone = contacts[:phone] if contacts.key?(:phone)
    self.telegram = contacts[:telegram] if contacts.key?(:telegram)
    self.mail = contacts[:mail] if contacts.key?(:mail)
  end

  #Переопределил метод чтобы красиво выводилось
  def to_s
    res = "#{last_name} #{first_name} #{surname}"
    res += " id=#{id}" unless id.nil?
    res += " phone=#{phone}" unless phone.nil?
    res += " git = #{git}" unless git.nil?
    res += " telegram=#{telegram}" unless telegram.nil?
    res += " mail=#{mail}" unless mail.nil?
    res
  end
  
end


