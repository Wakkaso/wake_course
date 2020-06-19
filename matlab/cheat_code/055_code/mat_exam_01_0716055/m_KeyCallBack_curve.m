%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Midterm Number: …
% Problem number: …
% Student Name:  …
% Student ID: …
% Email address: …
% Department:
% Date: …
% National Chiao Tung University, Taiwan
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% This callback function is invoked from MATLAB once 
% we register it to our application.
%
% When a key is pressed, this function is invoked.
% Thus, we have a chance to set our variables
% based on the keys that are pressed.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DO NOT modify this file 
% except that you are told to do so.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function m_KeyCallBack_curve(src,event)
    disp(event.Key);
global key_pressed_op_1;
global key_pressed_op_2;
global key_pressed_op_3;
global key_pressed_quit;

    
    switch(event.Key) 
        case 'c'
            key_pressed_op_3 = true;
        case 'n'
            key_pressed_op_1 = true;
        case 'm'
            key_pressed_op_2 = true;
        case 'q'
            key_pressed_quit = true;
        otherwise
            
    end
    
 end