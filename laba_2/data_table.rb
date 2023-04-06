class DataTable
  def initialize(table)
    self.table = table
    self.row_number = table.length
    self.column_number = count_column_number
  end
  attr_reader :row_number, :column_number

  def get_item(row, col)
    return nil if row>=row_number||col>=column_number
    table[row][col].dup
  end

  private
  attr_accessor :table
  attr_writer :row_number, :column_number

  def count_column_number
    columns_size=0
    table.each{|el| columns_size=el.length if el.length>columns_size }
    columns_size
  end
end
