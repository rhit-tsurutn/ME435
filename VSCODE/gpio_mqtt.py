import mqtt_helper as mh

class App:

    def __init__(self):
        # TODO Set up LEDs
        # TODO Set up pushbuttons

        self.mqtt_client = mh.MqttClient()
        self.mqtt_client.connect("subscription_topic_name="me435/tsurutn/#",
                                 )
        pass

    def mqtt_callback(self, message_type, message_payload):
        print("Received type: ", message_type)
        print("Received payload: ", message_payload)
        
def main():
    print("GPI MQTT")

main()