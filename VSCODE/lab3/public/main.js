async function sendCommand(command) {
    let response = await fetch("/api/" + command)
    let replyText = await response.text();
    console.log(replyText);

    document. querySelector("#replyText").innerHTML = replyText;

    return replyText;
}



function main() {
    console.log("Hello JavaScript!");
    // document.querySelector("#reset").innerHTML = "Hello";

    document.querySelector("#reset").onclick = () => {
        console.log("You pressed the reset button!");
        sendCommand("RESET");
    };

    document.querySelector("#x1").onclick = () => {
        console.log("You pressed the X-AXIS 1 button!");
        sendCommand("X-AXIS 1");
    };

    document.querySelector("#x2").onclick = () => {
        console.log("You pressed the X-AXIS 2 button!");
        sendCommand("X-AXIS 2");
    };

    document.querySelector("#x3").onclick = () => {
        console.log("You pressed the X-AXIS 3 button!");
        sendCommand("X-AXIS 3");
    };

    document.querySelector("#x4").onclick = () => {
        console.log("You pressed the X-AXIS 4 button!");
        sendCommand("X-AXIS 4");
    };

    document.querySelector("#x5").onclick = () => {
        console.log("You pressed the X-AXIS 5 button!");
        sendCommand("X-AXIS 5");
    };

    document.querySelector("#zExtend").onclick = () => {
        console.log("You pressed the Z-AXIS EXTEND button!");
        sendCommand("Z-AXIS EXTEND");
    };

    document.querySelector("#zRetract").onclick = () => {
        console.log("You pressed the Z-AXIS RETRACT button!");
        sendCommand("Z-AXIS RETRACT");
    };

    document.querySelector("#GRIPPER_OPEN").onclick = () => {
        console.log("You pressed the GRIPPER OPEN button!");
        sendCommand("GRIPPER OPEN");
    };

    document.querySelector("#GRIPPER_CLOSE").onclick = () => {
        console.log("You pressed the GRIPPER CLOSE button!");
        sendCommand("GRIPPER CLOSE");
    };

    document.querySelector("#LOADER_STATUS").onclick = () => {
        console.log("You pressed the LOADER STATUS button!");
        sendCommand("LOADER_STATUS");
    };

    document.querySelector("#move").onclick = () => {
        let startPos = document.querySelector("#moveFrom").value;
        let endPos = document.querySelector("#moveTo").value;
        sendCommand(`MOVE ${startPos} ${endPos}`);


        
    };
}

main();
