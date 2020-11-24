# Movie API Code Test

## Setup
**Version Requirements**
- Rails 6.0
- Ruby 2.5.3

**Steps**
1. `git clone git@github.com:rrabinovitch/aetna_movie_api.git`
2. `cd aetna_movie_api`
3. `bundle install`
4. `rails db:{create,migrate}` - _note that as of 11/17/20, running this command from `main` will only set up the `movies` database and table and not the `ratings` ones_
5. run tests: `bundle exec rspec`
6. run `rails s` and explore the endpoints documented below

## Endpoint Documentation
Base URL: `localhost:3000/api/v1`

### `GET /movies`
- Returns paginated list of movies; 50 per page
- query params:
  - `page` => specifies pagination; not specifying page defaults to page 1
  - Not yet implemented
    - `year` => filters movies by specified year sorted by descending chronological order of date
    - `genre` => filters movies by specified genre

#### Examples
Request: `GET localhost:3000/api/v1/movies?page=1`  
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
Request: `GET localhost:3000/api/v1/movies?year=2005`  
Response:
  ```
  {
      "data": [
          {
              "id": "21705",
              "type": "movie",
              "attributes": {
                  "imdbId": "tt0795338",
                  "title": "Barbie Diaries",
                  "genres": "[{\"id\": 10751, \"name\": \"Family\"}, {\"id\": 16, \"name\": \"Animation\"}]",
                  "releaseDate": "2005-12-31",
                  "budget": "$0.00"
              }
          },
          {
              "id": "26147",
              "type": "movie",
              "attributes": {
                  "imdbId": "tt0453365",
                  "title": "FC Venus",
                  "genres": "[{\"id\": 35, \"name\": \"Comedy\"}, {\"id\": 10749, \"name\": \"Romance\"}]",
                  "releaseDate": "2005-12-30",
                  "budget": "$2196531.00"
              }
          },
          {
              "id": "45035",
              "type": "movie",
              "attributes": {
                  "imdbId": "tt0492835",
                  "title": "King and the Clown",
                  "genres": "[{\"id\": 18, \"name\": \"Drama\"}, {\"id\": 36, \"name\": \"History\"}, {\"id\": 53, \"name\": \"Thriller\"}]",
                  "releaseDate": "2005-12-29",
                  "budget": "$0.00"
              }
          },
        ...
          {
              "id": "40017",
              "type": "movie",
              "attributes": {
                  "imdbId": "tt0499041",
                  "title": "Kalyug",
                  "genres": "[{\"id\": 10769, \"name\": \"Foreign\"}, {\"id\": 53, \"name\": \"Thriller\"}]",
                  "releaseDate": "2005-12-09",
                  "budget": "$0.00"
              }
          }
      ]
    }
  ```
Request: `GET localhost:3000/api/v1/movies?year=2005&page=5`  
Response: 
  ```
   {
      "data": [
          {
              "id": "53935",
              "type": "movie",
              "attributes": {
                  "imdbId": "tt0419922",
                  "title": "Living 'til the End",
                  "genres": "[{\"id\": 18, \"name\": \"Drama\"}, {\"id\": 10749, \"name\": \"Romance\"}]",
                  "releaseDate": "2005-10-21",
                  "budget": "$0.00"
              }
          },
          {
              "id": "59958",
              "type": "movie",
              "attributes": {
                  "imdbId": "tt0487907",
                  "title": "Gideon's Daughter",
                  "genres": "[{\"id\": 18, \"name\": \"Drama\"}]",
                  "releaseDate": "2005-10-21",
                  "budget": "$0.00"
              }
          },
          {
              "id": "123858",
              "type": "movie",
              "attributes": {
                  "imdbId": "tt0460926",
                  "title": "Scab",
                  "genres": "[]",
                  "releaseDate": "2005-10-21",
                  "budget": "$0.00"
              }
          },
          ...
                  {
              "id": "9621",
              "type": "movie",
              "attributes": {
                  "imdbId": "tt0368709",
                  "title": "Elizabethtown",
                  "genres": "[{\"id\": 35, \"name\": \"Comedy\"}, {\"id\": 18, \"name\": \"Drama\"}, {\"id\": 10749, \"name\": \"Romance\"}]",
                  "releaseDate": "2005-10-06",
                  "budget": "$57000000.00"
              }
          }
      ]
  }
  ```

### `GET /movies/:id`
- Returns details for the specified movie

#### Example
Request: `GET localhost:3000/api/v1/movies/11`  
Response:
  ```
  {
      "data": {
          "id": "11",
          "type": "movie",
          "attributes": {
              "imdbId": "tt0076759",
              "title": "Star Wars",
              "description": "Princess Leia is captured and held hostage by the evil Imperial forces in their effort to take over the galactic Empire. Venturesome Luke Skywalker and dashing captain Han Solo team together with the loveable robot duo R2-D2 and C-3PO to rescue the beautiful princess and restore peace and justice in the Empire.",
              "releaseDate": "1977-05-25",
              "budget": "$11000000.00",
              "runtime": 121,
              "genres": "[{\"id\": 12, \"name\": \"Adventure\"}, {\"id\": 28, \"name\": \"Action\"}, {\"id\": 878, \"name\": \"Science Fiction\"}]",
              "originalLanguage": null,
              "productionCompanies": "[{\"name\": \"Lucasfilm\", \"id\": 1}, {\"name\": \"Twentieth Century Fox Film Corporation\", \"id\": 306}]"
          }
      }
  }
  ```

## Reflections
- Strengths
  - [Documenting my process](https://gist.github.com/rrabinovitch/3c83ef68df4538d1b6402216a3b5aa57) as I ran into errors or points at which I had to make design decisions
  - Use of [project board](https://github.com/rrabinovitch/aetna_movie_api/projects/1)
    - I broke down the assignment into concrete components and issues to tackle one at a time
    - Tracked sad paths and bugs that I would come back to given time
  - Writing documentation as I progressed, rather than needing to write it all in one go at the end; helped keep perspective of the overall purpose of this API, outline of the endpoints and how different user stories might relate to each other, and allowed me to catch early mistakes in how I was building responses that I could easily and immediately fix (again rather than needing to catch them at the end - or even rather than not catching them at all at the end)
    - It was especially helpful/important that I was checking my responses in Postman as I built out and after I completed an endpoint - this was what allowed me to catch early on that I was running into the migration errors and datatype issues that arose over the weekend, even though my tests were passing just fine
  - Testing: using TDD as much as possible throughout the development process
- Areas for improvement / what I'd keep working on given more time
  - Squash commits to produce cleaner commit history
  - Figure out a way to have `genres` return as objects within movies responses ([see issue #10](https://github.com/rrabinovitch/aetna_movie_api/issues/10))
    - I tried working on this for about 30 min but elected to move on so other components of the assignment wouldn't be hindered in their progression
  - Configuring `ratings.db`
    - I'm disappointed that I wasn't able to successfully integrate the use of the second database; however, given that this is a design pattern I was not previously familiar with, I feel good about having researched this approach, found and followed documentation, and tried several tutorials. I was able to do the basic configuration in the [`chore/ratings_db_setup`](https://github.com/rrabinovitch/aetna_movie_api/commits/chore/ratings_db_setup) branch but hit a wall when it came to setting up the model associations/relationships. At that point, I had spent well over the recommended 3-4 hours on this challenge and decided to take a step back and instead prioritize reflecting on how this assignment went.
    - Worth noting is that it seems "joining across databases" is not possible in the version of Rails that I use: documentation [here](https://guides.rubyonrails.org/active_record_multiple_databases.html#joining-across-databases)
    - Given this limitation, with more time I would have looked into potentially building a rake task (like in [this](https://github.com/rrabinovitch/rails_engine_rr/blob/master/lib/tasks/seed_from_csv.rake) project) in order to seed the records from the two tables into one database as a final resort - though I understand part of the core expectations of this assignment was to use two separate databases.
  - In a non-timeboxed assignment, I likely would have implemented CI/CI, either with TravisCI (what I have most experience using) or CircleCI (which I used for my third quarter Turing final, [Sweater Weather](https://github.com/rrabinovitch/sweater_weather))
  - After having already implemented my use of the `fast_jsonapi` gem, I realized that the gem is no longer maintained
    - Had I realized this sooner / with more time, I would have considered an alternative approach to serializing the responses
  - The `movies#index` endpoint would ideally include the specified page number in responses
  - There are a handful of gems I set up that I either did not need or did not end up being able to use
    - I usually like to use `simplecov` to support my testing, but did not prioritize setting it up right away
  - Having learned about the testing pyramid last week, I would have liked to spend more time considering what kind of testing to prioritize
  - Randomization of mock test object attributes in order to make testing a bit more robust - would probably have used the `faker` gem



# Original Assignment Instructions
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
