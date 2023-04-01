require 'json'
require_relative 'base_student'

class Student<BaseStudent

  public_class_method :new

  attr_reader :last_name, :first_name, :surname
  public :phone, :telegram, :mail, 'id=', 'git=', :set_contacts

  def initialize(last_name:, first_name:, surname:, id:nil, phone:nil, telegram:nil, mail:nil, git:nil)
    self.last_name = last_name
    self.first_name = first_name
    self.surname = surname
    super(id:id, phone:phone, telegram:telegram, mail:mail, git:git)
  end

  #Конструктор строки
  def self.from_json_str(str)
    data=JSON.parse(str).transform_keys(&:to_sym)
    Student.new(**data)
  end

  #Валидация полей
  def self.is_name?(name)
    name.match(/^[А-Яа-я A-Za-z]+$/)
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

  def get_info
    git_info = " git=#{git}" unless git.nil?
    contact_info = "#{find_contacts}" unless find_contacts.nil?
    "#{short_name} #{git_info} #{contact_info}"
  end

  def short_name
  "#{last_name} #{first_name[0]}.#{surname[0]}"
  end

  def find_git
  "git=#{git}" unless has_git?
  end

  def to_hash
  info_hash = {}
  %i[last_name first_name surname id phone telegram mail git].each do |field|
    info_hash[field] = send(field) unless send(field).nil?
  end
  info_hash
  end

  def to_json_str
  JSON.generate(to_hash)
  end

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
