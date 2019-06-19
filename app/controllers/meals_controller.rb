require_relative '../views/meals_view'

class MealsController
  def initialize(meals_repository)
    @meals_repository = meals_repository
    @view = MealsView.new
  end

  def list
    # get all meals
    # displays all meals to user
    @view.display(@meals_repository.all)
  end

  # create new meal and add to repository
  def add
    # ask user for name and price
    attributes = {
      name: @view.ask_for_string(:name),
      price: @view.ask_for_number(:price)
    }
    # make new meal object
    # pass that to the repository
    @meals_repository.add(Meal.new(attributes))
  end
end
