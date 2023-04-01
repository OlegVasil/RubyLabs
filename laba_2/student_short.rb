require_relative 'base_student'

class StudentShort<BaseStudent

  public_class_method :new

  attr_reader :short_name
  private
  attr_writer :short_name

  public

  def initialize(id, str)
    data = JSON.parse(str).transform_keys(&:to_sym)
    self.short_name = data[:short_name]
    super(id:id, git:data[:git], phone:data[:phone], mail: data[:mail], telegram: data[:telegram])
  end

  def self.init_from_student(student)
    StudentShort.new(student.id, JSON.generate({"short_name": student.short_name, "phone": student.phone, "telegram": student.telegram, "mail": student.mail}))
  end

  def to_s
    result = short_name
    result += " id=#{id} " unless id.nil?
    result += " #{find_contacts}"
    result+= " #{find_git}"
    result
  end

  def validate_all?
    has_git? && has_contact?
  end
end
