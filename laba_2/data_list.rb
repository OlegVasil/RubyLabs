require_relative 'data_table'

class DataList
  private_class_method :new

  attr_writer :obj_list

  def initialize(obj_list)
    self.obj_list=obj_list
    self.selected_items=[]
  end

  def select(*numbers)
    selected_items.append(*numbers)
  end

  def get_select
    obj_list[selected_items].id
  end

  def get_names;
  end

  #Паттерн Паттерн
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

  protected

  attr_reader :obj_list
  attr_accessor :selected_items

  def get_fields(object)
    []
  end
end
