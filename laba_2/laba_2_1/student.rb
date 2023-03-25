require 'json'

class Student
  #Краткое объявление метода
  attr_accessor :id
  attr_reader :last_name, :first_name, :surname, :phone, :telegram, :mail, :git

  def initialize(last_name:, first_name:, surname:, id:nil, phone:nil, telegram:nil, mail:nil, git:nil)
    self.last_name = last_name
    self.first_name = first_name
    self.surname = surname
    self.id = id
    self.git = git
    set_contacts(**{telegram:telegram, phone: phone, mail:mail})
  end

  #Конструктор строки
  def self.from_json_str(str)
    data=JSON.parse(str).transform_keys(&:to_sym)
    Student.new(**data)
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
    raise ArgumentError, "Неккоректная фамилия #{last_name}" unless last_name.nil? || Student.is_name?(last_name)
    @last_name = last_name
  end

  def first_name=(first_name)
    raise ArgumentError, "Неккоректное имя: #{first_name}" unless first_name.nil? || Student.is_name?(first_name)
    @first_name = first_name
  end

  def surname=(surname)
    raise ArgumentError, "Неккорректное отчество: #{surname}" unless surname.nil? || Student.is_name?(surname)
    @surname = surname
  end

  def phone=(phone)
    raise ArgumentError, "Неккоректный номер: #{phone}" unless phone.nil? || Student.is_phone?(phone)
    @phone = phone
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

  def set_contacts(mail:nil, phone:nil, telegram:nil)
    self.mail = mail
    self.phone = phone
    self.telegram = telegram
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

#Валидация полей
# def self.is_id?(id)
#   id.match(/^\d+$/)
# end
# def self.from_str(str)
#   hashed = str.split(',')
#               .map{|v| v.split(":")}
#               .map{|v| [v[0].to_sym, v[1]]}
#               .to_h
#   Student.new(hashed)
#   #puts hashed
# end

