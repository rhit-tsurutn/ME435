import PlateLoader

def main():
    options = ["EXIT", "RESET", "X-AXIS", "GRIPPER", "Z-AXIS", "STATUS", "MOVE"]
    loader = PlateLoader.PlateLoader()
    loader.connect()
    for i, option in enumerate(options):
        print(f"{i}: {option}")
    while True:
        selection = int(input("Select a Command: "))
        if(selection == 0):
            break
        if(selection == 1):
            resp = loader.send_commands("RESET")
            print("response: ", resp)
        if(selection == 2):
            selection = int(input("Select a position (1 - 5): "))
            resp = loader.send_commands(f"X-AXIS {selection}")
            print("response: ", resp)
        if(selection == 3):
            selection = input("Enter OPEN or CLOSE: ").strip()
            resp = loader.send_commands(f'GRIPPER {selection}')
            print("response: ", resp)
        if(selection == 4):
            selection = input("Enter EXTEND or RETRACT: ").strip()
            resp = loader.send_commands(f'Z-AXIS {selection}')
            print("response: ", resp)
        if(selection == 5):
            resp = loader.send_commands("STATUS")
            print("response: ", resp)
        if(selection == 6):
            start = int(input("Select a start position (1 - 5): "))
            end = int(input("Select an end position (1 - 5): "))
            resp = loader.send_commands(f'MOVE {start} {end}')
            print("response: ", resp)

    loader.disconnect()

main()