require_relative 'data_table'
require_relative 'data_list'

class DataListStudentShort<DataList
  public_class_method :new

  def initialize(obj_list)
    super
  end

  def get_names
    %w[id short_name git find_contacts]
  end

  protected
  def get_fields(object)
    [object.short_name, object.git, object.find_contacts]
  end

end
