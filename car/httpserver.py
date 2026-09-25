import flask
import serial


ser = serial.Serial('/dev/ttyUSB0', 12900)
time.sleep(2.0)

ser.reset_input_buffer()
message="RESET"
print(message)
message_bytes = (message + "\n").encode()
print(message_bytes)

ser.write(message_bytes)

response_bytes=ser.readline()
print(response_bytes)
response = response_bytes.decode().strip()
print(response)
