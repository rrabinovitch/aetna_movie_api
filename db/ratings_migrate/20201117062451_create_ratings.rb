class CreateRatings < ActiveRecord::Migration[6.0]
  def change
    create_table "ratings", primary_key: "ratingId", force: :cascade do |t|
      t.integer "userId", null: false
      t.references "movie", null: false
      t.float "rating"

      t.timestamps
    end
  end
end
