import plateloader

def main():
    print("Serial Menu")
    loader = plateloader.PlateLoader("/dev/ttyUSB0")
    loader.connect()
    # loader = plateloader.PlateLoader()
    print("0. Exit")
    print("1. RESET")
    print("2. X-AXIS")
    print("3. GRIPPER")
    print("4. Z-AXIS")
    print("5. MOVE")
    print("6. Status")
    while True:
        selection = int(input("Selection: "))
        if selection == 0:
            break
        elif selection == 1:
            response = loader.send_command("RESET")
            print(response)
        elif selection == 2:
            response = loader.send_command("X-AXIS")
            print(response)
        elif selection == 3:
            response = loader.send_command("GRIPPER")
            print(response)
        elif selection == 4:
            response = loader.send_command("Z-AXIS")
            print(response)
        elif selection == 5:
            response = loader.send_command("MOVE")
            print(response)
        elif selection == 6:
            response = loader.send_command("LOADER_STATUS")
            print(response)

    loader.disconnect()
    print("Goodbye")
    




main()