import gpiozero as gz
import time
import signal

sequence = []

def record_and_on(led):
    sequence.append(led)
    led.on()

def play_sequence():
    for led in sequence:
        led.on()
        time.sleep(0.5)
        led.off()
        time.sleep(0.1)
    sequence.clear()

def main():
    red_led = gz.LED(14)
    yellow_led = gz.LED(15)
    green_led = gz.LED(18)

    button_red = gz.Button(22)
    button_yellow = gz.Button(23)
    button_green = gz.Button(24)
    button_play = gz.Button(25)

    button_red.when_pressed = lambda: record_and_on(red_led)
    button_red.when_released = red_led.off

    button_yellow.when_pressed = lambda: record_and_on(yellow_led)
    button_yellow.when_released = yellow_led.off

    button_green.when_pressed = lambda: record_and_on(green_led)
    button_green.when_released = green_led.off

    button_play.when_pressed = play_sequence

    signal.pause()

if __name__ == "__main__":
    main()