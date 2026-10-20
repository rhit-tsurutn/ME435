import threading
import flask
import plateloader

app=flask.Flask(__name__,
            static_url_path='',
            static_folder='')

serial_lock = threading.Lock()
loader = plateloader.PlateLoader()
loader.connect()

@app.get('/')
def hello_route():
    return flask.redirect("/webpageapp.html")

@app.get("/api/STATUS")
def handle_status():
    with serial_lock:
        response = loader.send_command("LOADER_STATUS")
    return response

@app.get("/api/RESET")
def handle_reset():
    with serial_lock:
        response = loader.send_command("RESET")
    return response

@app.get("/api/EXIT")
def handle_exit():
    with serial_lock:
        response = loader.disconnect()
    return response

@app.get("/api/Z-AXIS/<command>")
def handle_z(command):
    with serial_lock:
        response = loader.send_command("Z-AXIS " + command)
    return response

@app.get("/api/X-AXIS/<command>")
def handle_x(command):
    with serial_lock:
        response = loader.send_command("X-AXIS " + command)
    return response

@app.get("/api/GRIPPER/<command>")
def handle_gripper(command):
    with serial_lock:
        response = loader.send_command("GRIPPER " + command)
    return response

@app.get("/api/MOVE/<start>/<end>")
def handle_move(start, end):
    with serial_lock:
        response = loader.send_command(f"MOVE {start} {end}")
    return response

app.run(host='0.0.0.0', port=8080, use_reloader=False)

if __name__ == "__main__":
    print("Running Flask")