import movie

data_file = open("movies_out.txt", "r")
movies = []
for line in data_file:
    items=line.split(",")
    new_movie = movie.Movie()
    new_movie.title = items[0]
    new_movie.director = items[1]
    new_movie.year = items[2]
    movies.append(new_movie)

data_file.close()

for current in movies:
    print(current.title)

