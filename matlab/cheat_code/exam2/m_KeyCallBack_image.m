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
function m_KeyCallBack_image(src,event)
    disp(event.Key);
    global key_pressed_left;
    global key_pressed_right;
    global key_pressed_left_fast;
    global key_pressed_right_fast;
    global key_pressed_quit;
    global key_pressed_brightenUp;
    
    switch(event.Key) 
        case 'n'
            key_pressed_left_fast = true;
        case 'm'
            key_pressed_right_fast = true;
        case 'j'
            key_pressed_left = true;
        case 'k'
            key_pressed_right = true;
        case 'b'
            key_pressed_brightenUp = true;  
        case 'q'
            key_pressed_quit = true;
        otherwise
            
    end
    
 end