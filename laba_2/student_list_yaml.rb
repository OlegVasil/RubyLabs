require_relative 'base_student_list'
require 'yaml'

class StudentListYaml<BaseStudentList

  public_class_method :new

  private
  #получение массива хэшей из строки
  def list_hash_from_str(str)
    YAML.load(str).map {|hash| hash.transform_keys(&:to_sym)}
  end

  #получение строки заданного вида из массива хэшей
  def list_hash_to_str(list_hash)
    list_hash.map{ |hash| hash.transform_keys(&:to_s)}.to_yaml
  end

end