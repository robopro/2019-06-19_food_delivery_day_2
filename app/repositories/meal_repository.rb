require 'csv'
require_relative '../models/meal'
require_relative 'base_repository'

class MealRepository < BaseRepository
  # There's nothing here! What happened?!
  # Refactoring happened!
  # Yuss! All methods that are the same between our repos
  # have been moved to the BaseRepository.
  # And our MealRepository now inherits from BaseRepository

  private

  # However!
  # We leave these two methods in their respective classes,
  # because they require a bit more work to refactor.
  # You're free to try to inherit them, but finish
  # the exercise first.
  def load_csv
    options = { headers: :first_row, header_converters: :symbol }

    CSV.foreach(@csv_path, options) do |row|
      row[:id] = row[:id].to_i
      row[:price] = row[:price].to_i
      @elements << Meal.new(row)
    end
    @next_id = @elements.empty? ? 1 : @elements.last.id + 1
  end

  def save_csv
    CSV.open(@csv_path, 'wb') do |csv|
      csv << %i[id name price]
      @elements.each do |meal|
        csv << [meal.id, meal.name, meal.price]
      end
    end
  end
end
