from movie_library import *
import unittest


class TestMovieLibrary(unittest.TestCase):

    def test_add_movie(self):

        library = MovieLibrary()
        # 1. Add a new movie

        # 2. Assert the movie has been added
        
    def test_remove_movie(self):
        library=MovieLibrary()
        library.add("Movie 1","Director 1",2017)
                
        # 5. Remove the movie

        # 6. Assert the movie has been removed


if __name__ == '__main__':
    unittest.main()
