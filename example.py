import error_level_difference as ela
import PIL

ela.error_level_difference('dogs.jpg', 3, 30, 10)

PIL.Image.open('dogs_diff.jpg').show()