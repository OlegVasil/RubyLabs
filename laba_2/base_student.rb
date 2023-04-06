class BaseStudent

  #Абстрактный класс
  private_class_method :new

  protected

  attr_reader :phone, :mail, :telegram
  attr_writer :id

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

  def set_contacts(mail:nil, phone:nil, telegram:nil)
    self.mail = mail
    self.phone = phone
    self.telegram = telegram
  end

  public

  attr_reader :id, :git

  def initialize(id: nil, phone:nil, telegram: nil, mail: nil, git:nil )
    self.id=id
    set_contacts(**{telegram:telegram, phone: phone, mail:mail})
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

  def validate_all?
    has_git? && has_contact?
  end

  def find_contacts
    if has_contact?
      return "phone: #{phone}" unless phone.nil?
      return "telegram: #{telegram}" unless telegram.nil?
      "mail: #{mail}" unless mail.nil?
    end
    nil
  end
end


#Сеттеры
# def id=(id)
#   raise ArgumentError, "Неккоретный id #{id}" unless  id.nil? || Student.is_id?(id)
# end

#Валидация
# def self.is_id?(id)
#   id.match(/^\d+$/)
# end
