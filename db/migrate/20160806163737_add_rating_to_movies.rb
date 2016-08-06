class AddRatingToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :rating, :integer, limit: 1
  end
end
