import movie


class MovieLibrary:
    def __init__(self):
        self.items=[]

    def add(self, title, director, year):

        new_movie=movie.Movie()
        new_movie.title = title
        new_movie.director = director
        new_movie.year = year
        
        self.items.append(new_movie)

    def remove(self, position):
        self.items.remove(self.items[position])
        
    def count(self):
        return len(self.items)

    def find_by_title(self, title):
        found = None
        count = 0
        while len(self.items) > 0 and count < len(self.items) and found is None:
            if self.items[count].title == title:
                found = self.items[count]
            count += 1
        return found
