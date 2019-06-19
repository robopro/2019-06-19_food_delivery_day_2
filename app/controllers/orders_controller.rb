require_relative '../views/orders_view'

class OrdersController
  def initialize(meal_repository, employee_repository, customer_repository, order_repository)
    @meal_repository = meal_repository
    @employee_repository = employee_repository
    @customer_repository = customer_repository
    @order_repository = order_repository
    @view = OrdersView.new
  end

  def add
    # During the exercise the test asked you to find the meal, customer and employee by id.
    # Here is how you could do the same by asking for index instead.
    # (Check the OrdersView class.)
    @view.display_meals(@meal_repository.all)
    meal_index = @view.ask_for_number(:index) # => returns number/index
    meal = @meal_repository.all[meal_index]

    @view.display_customers(@customer_repository.all)
    customer_index = @view.ask_for_number(:index)
    customer = @customer_repository.all[customer_index]

    @view.display_delivery_guys(@employee_repository.all_delivery_guys)
    delivery_guy_index = @view.ask_for_number(:index)
    delivery_guy = @employee_repository.all_delivery_guys[delivery_guy_index]

    order = Order.new(meal: meal, customer: customer, employee: delivery_guy)
    @order_repository.add(order)

  end

  def list_undelivered_orders
    undelivered_orders = @order_repository.undelivered_orders
    @view.display(undelivered_orders)
  end

  def list_my_orders(employee)
    orders = @order_repository.employees_undelivered_orders(employee)
    @view.display(orders)
  end

  def mark_as_delivered(employee)
    list_my_orders(employee)
    id = @view.ask_for_number(:id)
    @order_repository.mark_as_delivered(id)
  end
end
