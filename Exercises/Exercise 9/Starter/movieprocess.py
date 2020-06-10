import movie
data_file = open("movies_out.txt", "r")
movies = []
for line in data_file:
    print(line.title())

data_file.close()

# write for loop to display movie data in movies list
