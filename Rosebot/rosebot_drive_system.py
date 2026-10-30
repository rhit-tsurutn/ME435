import motor 
import time
import math

class DriveSystem:

    def __init__(self):
        self.car = motor.Ordinary_Car()
        self.m = 0.8
        self.b = 0
        self.radius = 2.8

    def scale_speed(self, speed):
        """ Returns an int duty of 0 to 4095 (or 0 to -4095 based on the given speed. )"""
        return speed/100*4095

    def set_speeds(self, left_front, left_rear, right_front, right_rear):
        """ Pass in 4 speeds each -100 to 100 to set the wheel duty cycles. """
        self.car.set_motor_model(self.scale_speed(left_front),
                                 self.scale_speed(left_rear),
                                 self.scale_speed(right_front),
                                 self.scale_speed(right_rear))

    def go(self, left_wheel_speed, right_wheel_speed):
        """ Speeds as integers from -100 to 100. """
        self.set_speeds(left_wheel_speed, left_wheel_speed, right_wheel_speed, right_wheel_speed)

    def stop(self):
        self.set_speeds(0, 0, 0, 0)

    def go_straight_for_seconds(self, seconds, speed):
        self.go(speed, speed)
        time.sleep(seconds)
        self.stop()

    def go_straight_for_inches(self, inches, speed):
        inches_per_second = self.m * speed + self.b
        seconds = inches / inches_per_second
        self.go_straight_for_seconds(seconds, speed)

    def spin_in_place_for_seconds(self, seconds, speed):
        self.set_speeds(-speed, -speed, speed, speed)
        time.sleep(seconds)
        self.stop()

    def spin_in_place_for_degrees(self, degrees, speed):
        # degrees_per_second = inches_per_second / self.radius; # 2.8 = radius of turn
        degrees_per_second = speed * 10
        seconds = degrees/degrees_per_second
        print(seconds)
        self.set_speeds(-speed, -speed, speed, speed)
        time.sleep(seconds)
        self.stop()
    # s=r*theta

    def draw_polygon(self, sides, inches, speed):
        degrees = 360/sides
        for i in range(1, sides+1):
            self.spin_in_place_for_degrees(degrees, speed)
            self.go_straight_for_inches(inches, speed)
        




