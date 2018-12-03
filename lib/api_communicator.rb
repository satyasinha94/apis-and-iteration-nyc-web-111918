require 'rest-client'
require 'json'
require 'pry'

def get_info_from_api
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
  response_hash
end

  def get_movies(character)
  character_info = get_info_from_api["results"].find {|characters| characters["name"] == character}
       character_info["films"].map do |film|
         JSON.parse(RestClient.get(film))
       end
    end

def print_movies(films)
  films.each do |film|
    puts "_____________________"
    puts "Title: #{film["title"]}"
    puts "_____________________"
    puts "Episode: #{film["episode_id"]}"
    puts "_____________________"
    puts "Director: #{film["director"]}"
    puts "_____________________"
    puts "Producer: #{film["producer"]}"
  end
end

def show_character_movies(character)
  films = get_movies(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
