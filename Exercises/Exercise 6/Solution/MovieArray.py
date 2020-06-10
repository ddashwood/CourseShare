movies = ["Jaws", "Star Wars", "Vanilla Sky", "The Mission", "Bridget Jones Diary 2"]
# noinspection PyStubPackagesCompatibility
print(movies)
new_movie = input("Enter Movie Title to Add:")

# Check if movie exists if it doesn't then append to array, otherwise say it exists
if new_movie in movies:
    print("Movie exists!")
else:
    movies.append(new_movie)
    print(movies)
