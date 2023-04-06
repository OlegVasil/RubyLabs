require_relative 'data_table'
require_relative 'data_list'

class DataListStudentShort<DataList
  public_class_method :new

  def initialize(obj_list)
    super
  end

  def get_names
    %w[short_name git find_contacts]
  end

  def get_data
    id = 0
    data_student = obj_list.inject([]) do  |res, object|
      fields = [id, object.short_name, object.git, object.find_contacts]
      row = fields.inject([]) do |row,field|
        row<<field
      end
      id+=1
      res<<row
    end
    DataTable.new(data_student)
  end
end