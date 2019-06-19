require 'csv'
require_relative '../models/employee'

class EmployeeRepository
  def initialize(csv_path)
    @csv_path = csv_path
    @employees = []
    @next_id = 1
    load_csv if File.exist?(@csv_path)
  end

  def all
    @employees
  end

  def find_by_username(username)
    @employees.find { |employee| employee.username == username }
  end

  private

  def load_csv
    options = { headers: :first_row, header_converters: :symbol }

    CSV.foreach(@csv_path, options) do |row|
      row[:id] = row[:id].to_i
      @employees << Employee.new(row)
    end
    @next_id = @employees.empty? ? 1 : @employees.last.id + 1
  end
end
