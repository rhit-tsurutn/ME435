import time
import serial

class PlateLoader:
    def __init__(self, port="devtty/USB0"): # run python -m serial.tools.miniterm
        self.port = port

    def connect(self):
        self.ser = serial.Serial(self.port, baudrate=12900, timeout=15)
        time.sleep(2.0)
        self.ser.reset_input_buffer()

    def disconnect(self):
        self.ser.close()

    def send_commands(self, command):
        self.ser.reset_input_buffer()
        message_bytes = (command + "\n").encode()
        self.ser.write(message_bytes)

        response_bytes=self.ser.readline()
        response = response_bytes.decode().strip()
        return response
        

if __name__ == "__main__":
    print ("Quick Plate Loader Testing")
    loader = PlateLoader()
    loader.connect()
    resp = loader.send_commands("RESET")
    print("response: ", resp)
    loader.disconnect()
