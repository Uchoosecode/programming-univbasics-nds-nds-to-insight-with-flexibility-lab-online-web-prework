require 'pry'
# Provided, don't edit
require 'directors_database'

# A method we're giving you. This "flattens"  Arrays of Arrays so: [[1,2],
# [3,4,5], [6]] => [1,2,3,4,5,6].

def flatten_a_o_a(aoa)
  result = []
  i = 0

  while i < aoa.length do
    k = 0
    while k < aoa[i].length do
      result << aoa[i][k]
      k += 1
    end
    i += 1
  end

  result
end

def movie_with_director_name(director_name, movie_data)
  { 
    :title => movie_data[:title],
    :worldwide_gross => movie_data[:worldwide_gross],
    :release_year => movie_data[:release_year],
    :studio => movie_data[:studio],
    :director_name => director_name
  }
end


# Your code after this point

def movies_with_director_key(name, movies_collection)
  row = 0
  updated_movies = []
  while row < movies_collection.length do 
    mc_title = movies_collection[row]
    
    updated_movies <<  movie_with_director_name(name, mc_title)
    row += 1 
    
  end
  return updated_movies
end
 

def gross_per_studio(collection)
  row = 0 
  studios_gross = {}
  while row < collection.length do 
  binding.pry
  studio_name = collection[row][:studio]
  studio_total = collection[row][:worldwide_gross]
   
   if studios_gross[studio_name] 
     studios_gross[studio_name] = 0 
   end
      studios_gross[studio_name] += studio_total
       
  row += 1 
  end
    return studios_gross
end
  # GOAL: Given an Array of Hashes where each Hash represents a movie,
  # return a Hash that includes the total worldwide_gross of all the movies from
  # each studio.
  #
  # INPUT:
  # * collection: Array of Hashes where each Hash where each Hash represents a movie
  #
  # RETURN:
  #
  # Hash whose keys are the studio names and whose values are the sum
  # total of all the worldwide_gross numbers for every movie in the input Hash

def movies_with_directors_set(source)
  row = 0 
  director_movie = []
  while row < source.length do 
    name = source[row][:name]
    dr_movies = source[row][:movies]
    director_movie << movies_with_director_key(name, dr_movies)
    
  
  row += 1 
  end
  return director_movie
end
  

# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
