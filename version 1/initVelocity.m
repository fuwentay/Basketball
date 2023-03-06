function [v, t] = initVelocity(a)
    % Determine the initial velocity of the ball given that it's released at
    % some angle
    
    % Assumptions:
    % - ball is treated as a point mass of no radius
    % - only force acting on the ball is gravity
    
    % Defining constants
    h = 3.048; % height of basketball hoop
    l  = 4.572; % distance of foul line from hoop
    g = -9.81;  % gravitational acceleration
    y_0 = 1.8; % take height of release to be 1.8m
    
    % Determine lower bound of a
    % - a_min < a < pi/2
    a_min = atan((h-y_0)/l);
    
    % Time taken for ball to travel. Expression to solve was analytically
    % determined using kinematics equations.
    syms v
    t = l/(v*cos(a));
    S = solve(v*sin(a)*t + 0.5*g*t^2 == h - y_0);
    if abs(eval(S(1))) == (eval(S(1)))
        v = eval(S(1));
        t = l/(v*cos(a));
    else
        v = eval(S(2));
        t = l/(v*cos(a));
    end
