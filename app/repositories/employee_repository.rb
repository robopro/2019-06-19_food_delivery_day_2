require 'csv'
require_relative '../models/employee'
require_relative 'base_repository'

class EmployeeRepository < BaseRepository
  # The test does not want the EmployeeRepository to have an #add method.
  # So since we're inheriting from our BaseRepository, we have to
  # undefine the add method!
  undef_method :add

  def all_delivery_guys
    @elements.select { |element| element.delivery_guy? }
  end

  def find_by_username(username)
    @elements.find { |element| element.username == username }
  end

  private

  def load_csv
    options = { headers: :first_row, header_converters: :symbol }

    CSV.foreach(@csv_path, options) do |row|
      row[:id] = row[:id].to_i
      @elements << Employee.new(row)
    end
    @next_id = @elements.empty? ? 1 : @elements.last.id + 1
  end
end
