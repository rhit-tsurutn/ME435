import gpiozero as gz
import mqtt_helper as mh
import time


led_board = gz.LEDBoard(14, 15 ,18)
reset_button = gz.Button(23)

mqtt_client=mh.MqttClient()

def callback(type, payload):
  if(type == "leds"):
    led_board.value = payload
  
def send_reset():
  # print("hi")
  mqtt_client.send_message("reset")



def main():
  mqtt_client.connect(subscription_topic_name="tictactoe/#", publish_topic_name="tictactoe/reset")
  mqtt_client.callback=callback
  reset_button.when_pressed = send_reset
  try: 
    # led_board.value = [1, 1, 1]
    while True:
       pass

  except KeyboardInterrupt:
        led_board.close()
        print("Bye bye!")

  

main()