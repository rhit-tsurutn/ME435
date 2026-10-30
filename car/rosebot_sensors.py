#don't forget to add as properties to RoseBot
import gpiozero as gz

class Ultrasonic:
    def __init__(self):
        self.sensor = gz.DistanceSenor(echo=22, trigger=27)

    def get_cm(self):
        return round(self.sensor.distance * 100)

class LineSensor:
    def __init__(self):
        self.left = gz.LineSensor(14)
        self.mid =gz.LineSensor(15)
        self.right = gz.LineSensor(23)

    def get_left(self):
        if(self.left.value == 1):
           return 'B'
        return 'W'
    
    def get_right(self):
        if(self.right.value == 1):
            return 'B'
        return 'W'
    def get_middle(self):
        if(self.mid.value == 1):
            return 'B'
        return 'W'

    def get_line_word(self):
        return self.get_left() + self.get_middle() + self.get_right()

