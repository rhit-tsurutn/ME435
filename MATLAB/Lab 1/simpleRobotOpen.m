clc
clear all;
fprintf('Connecting to robot....');
s = serialport('COM4', 19200, "Timeout", 15);
pause(1.5);
writeline(s, 'INITIALIZE');
readline(s)
fprintf('Ready\n');