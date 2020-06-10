from movie_library import *
import unittest


class TestMovie(unittest.TestCase):

    def test_add_movie(self):

        library = MovieLibrary()
        library.add("Star Wars", "George Lucas", 1977)
        self.assertEqual(library.count(), 1)
        
    def test_remove_movie(self):
        library = MovieLibrary()
        library.add("Star Wars", "George Lucas", 1977)
        self.assertEqual(library.count(), 1)
        library.remove(0)
        self.assertEqual(library.count(), 0)

    def test_find(self):
        library = MovieLibrary()
        library.add("Star Wars", "George Lucas", 1977)
        found_movie = library.find_by_title("Star Wars")
        self.assertNotEqual(found_movie,None)


if __name__ == '__main__':
    unittest.main()
