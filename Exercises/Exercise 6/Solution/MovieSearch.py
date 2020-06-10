movies = [{"title": "Jaws", "director": "Steven Spielberg", "year": "1975"},
          {"title": "Star Wars", "director": "George Lucas", "year": "1977"},
          {"title": "Vanilla Sky", "director": "Cameron Crowe", "year": "2001"},
          {"title": "The Mission", "director": "Rolan Joffe", "year": "1986"},
          {"title": "Bridget Jones Diary", "director": "Sharron McGuire", "year": "2001"}]

title = input("Enter Movie Title:")
found = False
count = 0
while count < len(movies) and found is False:
    movie = movies[count]
    if movie["title"] == title:
        found = True
    else:
        count += 1

if found:
    print("Title:" + movies[count]["title"])
    print("Director:" + movies[count]["director"])
    print("Year:" + movies[count]["year"])

