
clc
fprintf("Hacky MQTT Test in MATLAB\n")
mqtClient = mqttclient("tcp://mosquito.csse.rose-hulman.edu");
% mqClient.Connected
mqClient.subscribe("tsurutn", "Callback", @myCallback)
for k = 1:3
    pause(1)
    %   message = sprintf("My number is #d.", k);
    %