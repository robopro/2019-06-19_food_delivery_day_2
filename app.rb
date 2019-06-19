require_relative 'router'
require_relative 'app/repositories/base_repository'
require_relative 'app/repositories/meal_repository'
require_relative 'app/controllers/meals_controller'

require_relative 'app/repositories/customer_repository'
require_relative 'app/controllers/customers_controller'

require_relative 'app/repositories/employee_repository'
require_relative 'app/controllers/sessions_controller'


meals_repo = MealRepository.new("data/meals.csv")
meals_controller = MealsController.new(meals_repo)

customers_repo = CustomerRepository.new("data/customers.csv")
customers_controller = CustomersController.new(customers_repo)

employee_repository = EmployeeRepository.new("data/employees.csv")
sessions_controller = SessionsController.new(employee_repository)

router = Router.new(meals_controller, customers_controller, sessions_controller)
router.run
