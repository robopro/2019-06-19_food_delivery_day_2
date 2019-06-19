require 'csv'
require_relative '../models/order'

class OrderRepository < BaseRepository
  def initialize(csv_path, meal_repository, employee_repository, customer_repository)
    @meal_repository = meal_repository
    @employee_repository = employee_repository
    @customer_repository = customer_repository
    super(csv_path)
  end

  def undelivered_orders
    @elements.reject { |element| element.delivered? }
  end

  def employees_undelivered_orders(employee)
    undelivered_orders.select { |order| order.employee == employee }
  end

  def mark_as_delivered(id)
    find(id).deliver!
    save_csv
  end

  private

  def load_csv
    CSV.foreach(@csv_path, headers: :first_row, header_converters: :symbol) do |row|
      attributes = transform_attributes(row)
      @elements << Order.new(attributes)
    end
    @next_id = @elements.empty? ? 1 : @next_id + 1
  end

  def transform_attributes(row)
    {
      id: row[:id].to_i,
      meal: @meal_repository.find(row[:meal_id].to_i),
      employee: @employee_repository.find(row[:employee_id].to_i),
      customer: @customer_repository.find(row[:customer_id].to_i),
      delivered: row[:delivered] == "true"
    }
  end

    def save_csv
    CSV.open(@csv_path, 'wb') do |csv|
      csv << %i[id delivered meal_id employee_id customer_id ]
      @elements.each do |order|
        csv << [order.id, order.delivered?, order.meal.id, order.employee.id, order.customer.id]
      end
    end
  end

end
