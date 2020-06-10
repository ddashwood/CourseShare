movies = [{"title": "Jaws", "director": "Steven Spielberg", "year": "1975"},
          {"title": "Star Wars", "director": "George Lucas", "year": "1977"},
          {"title": "Vanilla Sky", "director": "Cameron Crowe", "year": "2001"},
          {"title": "The Mission", "director": "Rolan Joffe", "year": "1986"},
          {"title": "Bridget Jones Diary", "director": "Sharron McGuire", "year": "2001"}]


def find_movie(title):

    found = None
    count = 0
    while count < len(movies) and found is None:
        movie = movies[count]
        if movie["title"] == title:
            found = movie
        else:
            count += 1

    return found
