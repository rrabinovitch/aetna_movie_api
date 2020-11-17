# Movie API Code Test

## About

## Setup

## Endpoint Documentation
Base URL: `localhost:3000/api/v1`

### `GET /movies`
- Returns paginated list of movies; 50 per page
- `page` query params: specifies which page of movies will be returned
  - not specifying the parameter defaults to page 1

#### Example
Request: `localhost:3000/api/v1/movies?page=1`  
Response:
  ```
  {
    "data": [
        {
            "id": "2",
            "type": "movie",
            "attributes": {
                "imdbId": "tt0094675",
                "title": "Ariel",
                "releaseDate": "1988-10-21",
                "budget": "$0.00",
                "genres": "[{\"id\": 18, \"name\": \"Drama\"}, {\"id\": 80, \"name\": \"Crime\"}]"
            }
        },
        {
            "id": "3",
            "type": "movie",
            "attributes": {
                "imdbId": "tt0092149",
                "title": "Shadows in Paradise",
                "releaseDate": "1986-10-16",
                "budget": "$0.00",
                "genres": "[{\"id\": 18, \"name\": \"Drama\"}, {\"id\": 35, \"name\": \"Comedy\"}]"
            }
        },
        {
            "id": "5",
            "type": "movie",
            "attributes": {
                "imdbId": "tt0113101",
                "title": "Four Rooms",
                "releaseDate": "1995-12-09",
                "budget": "$4000000.00",
                "genres": "[{\"id\": 80, \"name\": \"Crime\"}, {\"id\": 35, \"name\": \"Comedy\"}]"
            }
        },
        {
            "id": "6",
            "type": "movie",
            "attributes": {
                "imdbId": "tt0107286",
                "title": "Judgment Night",
                "releaseDate": "1993-10-15",
                "budget": "$0.00",
                "genres": "[{\"id\": 28, \"name\": \"Action\"}, {\"id\": 53, \"name\": \"Thriller\"}, {\"id\": 80, \"name\": \"Crime\"}]"
            }
        },
      ...
    ]
  }
  ```

## Reflections
- Genres:
  - I would have liked to get genres within movie JSON objects to return as nested objects rather than a JSON string:
  ```
  "genres": [
      {
          "id": 18,
          "name": "Drama"
      },
      {
          "id": 80,
          "name": "Crime"
      }
  ]
  ```
    - I had successfully achieved this but it was causing issues with the tests so I reverted back to the original JSON string being returns with the intention of coming back to this given more time
    - Original approach: JSON parsing genres in `MovieSerializer`
      ```rb
      # app/serializers/movie_serializer.rb
      attribute :genres #do |movie|
        JSON.parse(movie.genres)
      end
      ```
    - errors
      ```
      2) List All Movies Returns 50 movies per page
        Failure/Error: JSON.parse(movie.genres)

        JSON::ParserError:
        416: unexpected token at '{:id=>18, :name=>"Drama"}, {:id=>80, :name=>"Crime"}]'
        # ./app/serializers/movie_serializer.rb:7:in `block in <class:MovieSerializer>'
        # ./app/controllers/api/v1/movies_controller.rb:5:in `index'
        # ./spec/requests/api/v1/all_movies_request_spec.rb:30:in `block (2 levels) in <top (required)>'
      ```


## Pre-requisites

* An IDE or text editor of your choice
* [Sqlite3](http://www.sqlitetutorial.net/)


## Task
Your task is to create an API on top of a couple different databases.  It should conform to the user stories provided below.  You are free to use whatever language you prefer.  Google and the interwebs are at your disposal.

**The Databases**
The databases are provided as a SQLite3 database in `db/`.  It does not require any credentials to login.  You can run SQL queries directly against the database using:

```
sqlite <path to db file>
```

`.tables` will return a list of available tables and `.schema <table>` will provide the schema.

## Considerations
When developing your solution, please consider the following:

* Structure of your endpoints - Can you easily extend the API to support new endpoints as feature requests come in?
* Quality of your code - Does your code demonstrate the use of design patterns?
* Testability - Is your code testable?
* Can your solution be easily configured and deployed?  Consider guidelines from [12 Factor App](http://12factor.net/)


## User Stories

#### List All Movies
AC:

* An endpoint exists that lists all movies
* List is paginated: 50 movies per page, the page can be altered with the `page` query params
* Columns should include: imdb id, title, genres, release date, budget
* Budget is displayed in dollars

#### Movie Details
AC:

* An endpoint exists that lists the movie details for a particular movie
* Details should include: imdb id, title, description, release date, budget, runtime, average rating, genres, original language, production companies
* Budget should be displayed in dollars
* Ratings are pulled from the rating database

#### Movies By Year
AC:

* An endpoint exists that will list all movies from a particular year
* List is paginated: 50 movies per page, the page can be altered with the `page` query params
* List is sorted by date in chronological order
* Sort order can be descending
* Columns include: imdb id, title, genres, release date, budget

#### Movies By Genre
AC:

* An endpoint exists that will list all movies by a genre
* List is paginated: 50 movies per page, the page can be altered with the `page` query params
* Columns include: imdb id, title, genres, release date, budget

## Tips

* This is a test of your abilities and not how fast you can crank through random stories.  As such, it is more important to produce well structured code that meets the criteria in the user stories rather than getting all stories done.
* If you get stuck, please ask someone.  We want to know how you work both as an individual and as part of a team.  You will not lose points for asking for help on something that is unclear or where you are stuck.
