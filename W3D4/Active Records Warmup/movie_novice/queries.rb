# == Schema Information
#
# Table name: actors
#
#  id          :integer      not null, primary key
#  name        :string
#
# Table name: movies
#
#  id          :integer      not null, primary key
#  title       :string
#  yr          :integer
#  score       :float
#  votes       :integer
#  director_id :integer
#
# Table name: castings
#  id          :integer      not null, primary key
#  movie_id    :integer      not null
#  actor_id    :integer      not null
#  ord         :integer


def find_angelina
  Actor.find_by(name: "Angelina Jolie")
end

def top_titles

  Movie
    .select("movies.id, movies.title")
    .where("score >= 9")
  # get movie titles from movies with scores greater than or equal to 9
  # hint: use 'select' and 'where'

end

def star_wars

  Movie
    .select("movies.id, movies.title, movies.yr")
    .where("title LIKE 'Star Wars%'")
  #display the id, title and year of each Star Wars movie in movies.
  # hint: use 'select' and 'where'

end


def below_average_years

  Movie
    .select("movies.yr, COUNT(*) AS bad_movies")
    .where("score < 5")
    .group("movies.yr")
    .order("yr ASC")
  #display each year with movies scoring under 5,
  #with the count of movies scoring under 5 aliased as bad_movies,
  #in descending order
  # hint: use 'select', 'where', 'group', 'order'

end

def alphabetized_actors

  Actor
    .order("name")
    .limit(10)

  # display the first 10 actor names ordered from A-Z
  # hint: use 'order' and 'limit'
  # Note: Ubuntu users may find that special characters
  # are alphabetized differently than the specs.
  # This spec might fail for Ubuntu users. It's ok!

end

def pulp_fiction_actors

  Actor
    .select("actors.id, actors.name")
    .joins(:movies)
    .where("movies.title = 'Pulp Fiction'")

  # practice using joins
  # display the id and name of all actors in the movie Pulp Fiction
  # hint: use 'select', 'joins', 'where'

end

def uma_movies

  Movie
    .select("movies.id, movies.title, movies.yr")
    .joins(:actors)
    .where("actors.name = 'Uma Thurman'")
    .order("movies.yr ASC")

  #practice using joins
  # display the id, title, and year of movies Uma Thurman has acted in
  # order them by ascending year
  # hint: use 'select', 'joins', 'where', and 'order'

end
