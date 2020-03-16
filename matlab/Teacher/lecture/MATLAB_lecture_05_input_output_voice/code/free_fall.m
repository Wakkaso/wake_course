clear; clc;
h0 = input('Initial height (in meters): ');
tmax=input('The time the object is in the air (in seconds):');
s = input('The initial speed (in meters per second): ');
a = -9.81;   % meters per second squared
t = 0:0.01:tmax;
h = h0 + s.*t + 1/2.*a.*t.^2
plot(t,h,t,h,'o');
