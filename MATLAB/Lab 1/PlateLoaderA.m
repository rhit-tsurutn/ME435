clc; clear all;
s = serialport('COM4', 19200, 'Timeout', 15);
% writeline(s,'RESET');
% readline(s)
% writeline(s,'X-AXIS 1');
% readline(s)
% writeline(s,'GRIPPER OPEN');
% readline(s)
% writeline(s,'Z-AXIS EXTEND');
% readline(s)
% writeline(s,'GRIPPER CLOSE');
% readline(s)
% writeline(s,'Z-AXIS RETRACT');
% readline(s)
% writeline(s,'X-AXIS 5');
% readline(s)
% writeline(s,'Z-AXIS EXTEND');
% readline(s)
% writeline(s,'GRIPPER OPEN');
% readline(s)
% writeline(s,'Z-AXIS RETRACT');
% readline(s)
% writeline(s,'GRIPPER CLOSE');
% readline(s)


writeline(s,'X-AXIS 4   ');
readline(s)
