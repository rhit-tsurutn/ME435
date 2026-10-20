
options =  ["Reset", "X-Axis", "Z-Axis", "Gripper", "Move", "Status", "Special Moves", "Exit"];
while(true)
    choice = menu("Choose command",options);
    switch options(choice)
        case "Reset"
            fprintf("Reset\n");
            writeline(s, "RESET");
        % case "X-Axis"
            fprintf("X-Axis\n");
            loc = menu("Choose station", '1', '2' ,'3', '4', '5');
            writeline(s, "X-AXIS " + loc);
        case "Z-Axis"
            fprintf("Z-Axis\n");
            loc = menu("Choose extension", 'RETRACT', 'EXTEND');
            if loc == 1, state = "RETRACT"; else,  state = "EXTEND"; end
            fprintf( "%s", state);
            writeline(s, "Z-AXIS " + state);
        case "Gripper"
            fprintf("Gripper\n");
            loc = menu("Choose state", 'OPEN', 'CLOSE');
            if loc == 1, state = "OPEN"; else,  state = "CLOSE"; end
            writeline(s, "GRIPPER " + state);
        case "Move"
            fprintf("Move\n");
            from = listdlg('ListString', ["1", "2", "3", "4", "5"], 'PromptString', "From: ", 'SelectionMode', "single");
            to = listdlg('ListString', ["1", "2", "3", "4", "5"], 'PromptString', "To: ", 'SelectionMode', "single");
            writeline(s, "MOVE " + from + " " + to);
        case "Status"
            fprintf("Status\n");
            writeline(s, "LOADER_STATUS");
        case "Special Moves"
            fprintf("SPECIAL \n");
            loc = menu("Choose special move: ", 'Stack3');
            uiwait(helpdlg("Please place a plates at location 1 and 5"));
            writeline(s,'X-AXIS 1');
            readline(s)
            writeline(s,'GRIPPER OPEN');
            readline(s)
            writeline(s,'Z-AXIS EXTEND');
            readline(s)
            writeline(s,'GRIPPER CLOSE');
            readline(s)
            writeline(s,'Z-AXIS RETRACT');
            readline(s)
            writeline(s,'X-AXIS 3');
            readline(s)
            writeline(s,'Z-AXIS EXTEND');
            readline(s)
            writeline(s,'GRIPPER OPEN');
            readline(s)
            writeline(s,'Z-AXIS RETRACT');
            readline(s)
            writeline(s,'GRIPPER CLOSE');
            readline(s)
            writeline(s,'X-AXIS 5');
            readline(s)
            writeline(s,'GRIPPER OPEN');
            readline(s)
            writeline(s,'Z-AXIS EXTEND');
            readline(s)
            writeline(s,'GRIPPER CLOSE');
            readline(s)
            writeline(s,'Z-AXIS RETRACT');
            readline(s)
            writeline(s,'X-AXIS 3');
            readline(s)
            writeline(s,'GRIPPER OPEN');
            readline(s)
        case "Exit"
            fprintf("Exiting\n");
            break
        otherwise
            fprintf("TODO: UNHANDELED OPTION\nExiting...")
            break
    end
    readline(s)
end