movies = [{"title": "Jaws", "director": "Steven Spielberg", "year": "1975"},
          {"title": "Star Wars", "director": "George Lucas", "year": "1977"},
          {"title": "Vanilla Sky", "director": "Cameron Crowe", "year": "2001"},
          {"title": "The Mission", "director": "Rolan Joffe", "year": "1986"},
          {"title": "Bridget Jones Diary", "director": "Sharron McGuire", "year": "2001"}]

title = input("Enter Movie Title:")
found = None
count = 0
while count < len(movies) and found is None:
    movie = movies[count]
    if movie["title"] == title:
        found = movie
    else:
        count += 1

if found is not None:
    print("Title:" + found["title"])
    print("Director:" + found["director"])
    print("Year:" + found["year"])

