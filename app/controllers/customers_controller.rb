require_relative '../views/customers_view'

class CustomersController
  def initialize(customers_repository)
    @customers_repository = customers_repository
    @view = CustomersView.new
  end

  def list
    # get all customers
    # displays all customers to user
    @view.display(@customers_repository.all)
  end

  # create new customer and add to repository
  def add
    # ask user for name and price
    attributes = {
      name: @view.ask_for_string(:name),
      address: @view.ask_for_string(:address)
    }
    # make new customer object
    # pass that to the repository
    @customers_repository.add(Customer.new(attributes))
  end
end
