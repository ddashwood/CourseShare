data_file = open("movies.txt", "r")

for line in data_file:
    print(line.title())

data_file.close()
