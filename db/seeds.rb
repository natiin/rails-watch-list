# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'open-uri'
require 'pry-byebug'

url = 'http://tmdb.lewagon.com/movie/top_rated'
movies_serialized = URI.open(url).read
movies = JSON.parse(movies_serialized)

puts 'start seeding...'

index = 0
Movie.destroy_all
Bookmark.destroy_all

10.times do
  movie = Movie.create!(
    title: movies['results'][index]['title'],
    overview: movies['results'][index]['overview'],
    poster_url: "https://image.tmdb.org/t/p/w300#{movies['results'][index]['poster_path']}",
    rating: movies['results'][index]['vote_average']
  )
  movie.poster_url = "https://image.tmdb.org/t/p/w300#{movies['results'][index]['poster_path']}"
  movie.save!
  # puts movie.poster_url
  index += 1
end

puts 'end seeding...'
