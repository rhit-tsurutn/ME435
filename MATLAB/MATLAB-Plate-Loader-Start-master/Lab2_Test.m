close all; clear all; clc
obj = PlateLoader(4);
myTimes = [0 60 20 30 0
           0 0 30 30 0
           0 30 0 30 0
           0 30 30 0 0
           0 30 20 60 0];
obj.setTimeValues(myTimes);
obj.movePlate(3,4);