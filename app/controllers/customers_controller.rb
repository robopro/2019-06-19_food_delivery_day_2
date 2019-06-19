require_relative '../views/customers_view'

class CustomersController
  def initialize(customers_repo)
    @customers_repo = customers_repo
    @view = CustomersView.new
  end

  def list
    # get all customers
    # displays all customers to user
    @view.display(@customers_repo.all)
  end

  # create new customer and add to repo
  def add
    # ask user for name and price
    attributes = {
      name: @view.ask_for_string(:name),
      address: @view.ask_for_string(:address)
    }
    # make new customer object
    # pass that to the repo
    @customers_repo.add(Customer.new(attributes))
  end
end
