from rosebot import RoseBot

def main():
    print("Lab 5b Line Following")
    robot = RoseBot()

    try:
        while True:
            ##Get ultrasonic sensor
            distance = robot.ultrasonic.get_cm()
            if(distance < 20):
               robot.stop()
            else:
                robot.go()
            

            

            #     move right
            # }else if(right_trigger){
            #     move left
            # }if(left_trigger){
            
    except KeyboardInterrupt:
        robot.drive_system.stop()
        print("Bye bye!")

main()