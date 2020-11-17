# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 0) do

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
  end

end
