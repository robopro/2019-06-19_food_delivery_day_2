require 'csv'
require_relative '../models/customer'
require_relative 'base_repository'

class CustomerRepository < BaseRepository
  # There's nothing here! What happened?!
  # Refactoring happened!
  # Yuss! All methods that are the same between our repos
  # have been moved to the BaseRepository.
  # And our CustomerRepository now inherits from BaseRepository

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
      @elements << Customer.new(row)
    end
    @next_id = @elements.empty? ? 1 : @elements.last.id + 1
  end

  def save_csv
    CSV.open(@csv_path, 'wb') do |csv|
      csv << %i[id name address]
      @elements.each do |customer|
        csv << [customer.id, customer.name, customer.address]
      end
    end
  end
end
