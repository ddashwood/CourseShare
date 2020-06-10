data_file = open("movies.txt", "r")
data_file_out = open("movies_out.txt", "w")

for line in data_file:
    print(line.title())
    data_file_out.write(line.title())

data_file_out.close()
data_file.close()
