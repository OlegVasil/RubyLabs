class BaseStudent

  #Абстрактный класс
  private_class_method :new
  protected

  attr_reader :phone, :mail, :telegram

  public
  attr_reader :id, :git
  def initialize(id: nil, phone:nil, telegram: nil, mail: nil, git:nil )
    self.id=id
    set_contacts(**{telegram:telegram, phone: phone, mail:mail})
  end

  #Сеттеры
  def id=(id)
    raise ArgumentError, "Неккоретный id #{id}" unless  id.nil? || Student.is_id?(id)
  end

  def telegram=(telegram)
    raise ArgumentError, "Неккоректный телеграм #{telegram}" unless telegram.nil? || Student.is_telegram?(telegram)
    @telegram = telegram
  end

  def mail=(mail)
    raise ArgumentError, "Неккоректный mail: #{mail}" unless mail.nil? || Student.is_mail?(mail)
    @mail = mail
  end

  def git=(git)
    raise ArgumentError, "Неккоректный гит: #{git}" unless git.nil? || Student.is_git?(git)
    @git = git
  end

  def phone=(phone)
    raise ArgumentError, "Неккоректный номер: #{phone}" unless phone.nil? || Student.is_phone?(phone)
    @phone = phone
  end

  #Валидация
  def self.is_id?(id)
    id.match(/^\d+$/)
  end

  def self.is_phone?(phone)
    phone.match(/^[\d{10}]+$/)
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

  #Проверка на гит и контакт
  def has_git?
    !git.nil?
  end

  def has_contact?
    !phone.nil? || !telegram.nil? || !mail.nil?
  end

  #Вывод гита и контактов
  def find_git
    "git=#{git}" unless has_git?
  end

  def find_contacts
    return "phone: #{phone}" unless phone.nil?
    return "telegram: #{telegram}" unless telegram.nil?
    "mail: #{mail}" unless mail.nil?
  end

  def set_contacts(mail:nil, phone:nil, telegram:nil)
    self.mail = mail
    self.phone = phone
    self.telegram = telegram
  end

end
