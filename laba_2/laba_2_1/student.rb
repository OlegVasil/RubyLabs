class Student
  #Устанавливаем доступ к методам только на чтение (геттер, в моем понимании)
  attr_reader :id, :last_name, :first_name, :surname, :phone, :telegram, :mail, :git

  def initialize(last_name, first_name, surname)
    @last_name = last_name
    @first_name = first_name
    @surname = surname
  end

  #Сеттеры полей
  def id=(value)
    if value.is_a?(Integer)
      @id = value
    else
      raise ArgumentError, "Неккоректный id: #{value}"
    end
  end

  def phone=(value)
    if value.is_a?(String)
      @phone = value
    else
      raise ArgumentError, "Неккоректный телефон: #{value}"
    end
  end

  def telegram=(value)
    if value.is_a?(String)
      @telegram = value
    else
      raise ArgumentError, "Неккоректный телеграм #{value}"
    end
  end

  def email=(value)
    if value.is_a?(String)
      @email = value
    else
      raise ArgumentError, "Неккоректный email: #{value}"
    end
  end

  def git=(value)
    if value.is_a?(String)
      @git = value
    else
      raise ArgumentError, "Неккоректный гит: #{value}"
    end
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


