class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table "movies", primary_key: "movieId", force: :cascade do |t|
      t.text "imdbId", null: false
      t.text "title", null: false
      t.text "overview"
      t.text "productionCompanies"
      t.text "releaseDate"
      t.integer "budget"
      t.integer "revenue"
      t.integer "runtime"
      t.text "language"
      t.text "genres"
      t.text "status"

      t.timestamps
    end
  end
end
