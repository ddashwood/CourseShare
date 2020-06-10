data_file_out = open("topFive.txt", "a")

title = input("Enter Movie Title:")
director = input("Enter the Director:")
year = input("Enter Year of Release:")
movie_data = title + "," + director + "," + year
movie_data += "\n"
data_file_out.write(movie_data)
data_file_out.close()

