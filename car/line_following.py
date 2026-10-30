from rosebot import RoseBot

def main():
    print("Lab 5b Line Following")
    robot = RoseBot()

    try:
        while True:
            ##Get ultrasonic sensor
            distance = robot.ultrasonic.get_cm()
            if(distance < 20){
               robot.stop()
            }else{
                robot.go()
            }

            line_word = robot.linesensor.get_line_word()
            if(line_word == "WWB"):
                robot.drive_system.set_speeds(-20, 20, 20, -20) # move_right
            elif(line_word == "BWW"):
                robot.drive_system.set_speeds(20, -20, -20, 20) # move_left
            else:
                robot.go(20, 20)

            
    except KeyboardInterrupt:
        robot.drive_system.stop()
        print("Bye bye!")

main()