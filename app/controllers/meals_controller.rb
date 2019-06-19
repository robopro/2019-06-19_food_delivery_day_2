require_relative '../views/meals_view'

class MealsController
  def initialize(meals_repo)
    @meals_repo = meals_repo
    @view = MealsView.new
  end

  def list
    # get all meals
    # displays all meals to user
    @view.display(@meals_repo.all)
  end

  # create new meal and add to repo
  def add
    # ask user for name and price
    attributes = {
      name: @view.ask_for_string(:name),
      price: @view.ask_for_number(:price)
    }
    # make new meal object
    # pass that to the repo
    @meals_repo.add(Meal.new(attributes))
  end
end
