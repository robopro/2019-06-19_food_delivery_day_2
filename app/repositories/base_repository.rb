require 'csv'

# We use inheritance when we have classes/objects that
# behave similar and share functionality.
#
# In our example both the MealRepository and CustomerRepository
# have identical #initialize, #all, #add and #find.
# Which makes these methods the perfect example of shared behavior,
# and thus => A good case for inheritance!
class BaseRepository
  def initialize(csv_path)
    @csv_path = csv_path
    # The base class does not deal with either Meal objects,
    # or Customer objects. So we give the variable a generic name.
    # Because we don't really know what kind of object will be stored.
    # !!! IMPORTANT !!!
    #
    #That also means we need to rename all the
    # variable calls in the child classes that correspond to our new
    # generic name variable. (If you look at MealRepository it no longer
    # refers to an @meals, but it does refer to an @elements!)
    @elements = []
    @next_id = 1
    load_csv if File.exist?(@csv_path)
  end

  def all
    @elements
  end

  def add(element)
    element.id = @next_id
    @elements << element
    save_csv
    @next_id += 1
  end

  def find(id)
    @elements.find { |element| element.id == id }
  end
end
